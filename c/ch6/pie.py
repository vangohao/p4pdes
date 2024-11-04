import matplotlib.pyplot as plt
import numpy as np
from matplotlib import gridspec

LOG_SCALE = True

fig = plt.figure(figsize=(7,3))

spec = gridspec.GridSpec(ncols=2, nrows=1,
                         width_ratios=[3.2, 2.2])
ax1 = fig.add_subplot(spec[0])
ax = fig.add_subplot(spec[1])

algs = ["jacobi", "gs", "gmres", "ilu", "ilu1"]

linestyles = [(0, (3, 1, 1, 1)), "--", "-.", ":", "-"]

labels = ["Jacobi", "Gauss-Seidel", "GMRES", "GMRES-ILU(0)", "GMRES-ILU(1)"]
colors = ['#C05046', '#FFC000', '#4BACC6', '#50632A', '#5442CE']

cnt = 0

for alg in algs:
    # Read string line by line
    with open(alg + ".out") as f:
        lines = f.readlines()
        # match "||r(i)||/||b||"
        # forexample "  1002 KSP preconditioned resid norm 4.663990017867e-04 true resid norm 1.865596007147e-03 ||r(i)||/||b|| 8.704886384816e-01"
        # I need 1002 and 8.704886384816e-01
        its = []
        res = []
        for line in lines:
            if "||r(i)||/||b||" in line:
                its.append(int(line.split()[0]))
                res.append(float(line.split()[-1]))
        ax1.plot(its, res, label=labels[cnt], linestyle=linestyles[cnt], color=colors[cnt])
        cnt += 1

if LOG_SCALE:
    ax1.set_yscale("log")
    ax1.legend()
    ax1.set_ylim(1e-3, 1e0 +0.5)
else:
    ax1.legend(loc="lower right")
    ax1.set_ylim(0,1)
ax1.set_xlim(0, 2000)
ax1.set_ylabel("Relative Residual Norm")
ax1.set_xlabel("Number of Iterations")
ax1.set_title("Convergence Comparison")


algs = ["ilu0-gpu", "ilu1-gpu"]

# plt.figure(figsize=(5,2.5))

linestyles = [(0, (3, 1, 1, 1)), "--", "-.", ":", "-"]

operators = ["VecMDot", "VecNorm", "VecScale", "VecMAXPY", "VecNormalize", "VecTDot", "VecAXPY", "VecAYPX", "MatMult", "MatSolve", "KSPSolve"]

vec_ops = ["VecMDot", "VecNorm", "VecScale", "VecMAXPY", "VecNormalize", "VecTDot", "VecAXPY", "VecAYPX"]
spmv = ["MatMult"]
spsv = ["MatSolve"]

names = ["BLAS1", "SpMV", "SpTRSV"]
cnt = 0

rings = []


size = 0.33

cmap = plt.get_cmap("tab20")
outer_colors = ['#C05046',  '#FFC000','#4BACC6']
inner_colors = ['#C05046', '#FFC000','#4BACC6']

for alg in algs:
    time_vec = 0
    time_spmv = 0
    time_spsv = 0
    time_total = 0
    # Read string line by line
    with open(alg + ".out") as f:
        lines = f.readlines()
        # match "||r(i)||/||b||"
        # forexample "VecNormalize         202 1.0 1.1573e+00 1.0 2.54e+09 1.0 0.0e+00 0.0e+00 0.0e+00  1  1  0  0  0   1  1  0  0  0  2196       0      0 0.00e+00    0 0.00e+00  0"
        # I need VecNormalize &&  1.1573e+00
        for line in lines:
            for op in operators:
                if line.startswith(op):
                    count = int(line.split()[1])
                    time = float(line.split()[3])
                    if op in vec_ops:
                        time_vec += time/count*200
                    elif op in spmv:
                        time_spmv += time/count*200
                    elif op in spsv:
                        time_spsv += time/count*200
                    # elif op == "KSPSolve":
                    #     time_total = time
                    break
        time_total = time_vec + time_spmv + time_spsv
        print(alg, time_vec / time_total, time_spmv / time_total, time_spsv / time_total)
        rings.append([time_vec / time_total, time_spmv / time_total, time_spsv / time_total]) 
            #   (time_total - time_vec - time_spmv - time_spsv) / time_total)

def my_autopct(pct):
	return ('%3.1f%%' % pct) if pct > 3 else ''

tmp=ax.pie(rings[0], autopct=my_autopct,radius=1, startangle=0, colors=outer_colors, pctdistance=0.8, labeldistance=1.6,     
           wedgeprops=dict(width=size, edgecolor='w'), textprops=dict(size=8,color='w'), center=(0,1))

tmp1 = ax.pie(rings[1], autopct=my_autopct,radius=1-size, startangle=0,colors=inner_colors,pctdistance=0.75, labeldistance=0.65,
       wedgeprops=dict(width=size, edgecolor='w', alpha=0.43), textprops=dict(size=8), center=(0,1), )

legend2 = ax.legend(tmp[0], names,loc=(0.5, 0.1), title="GMRES-ILU(0)")

legend1 = ax.legend(tmp[0], names,loc=(-0.2, -0.2), fontsize=9, title="GMRES-ILU(0)")
ax.legend(tmp1[0], names,loc=(0.5, -0.2), fontsize=9, title="GMRES-ILU(1)")
ax.add_artist(legend1)
# ax.text(-0.3-0.5,0.8,"Optimized", fontsize=14, color='white')
# ax.text(-0.3-0.5,0.46,"Reference", fontsize=14, color='black')

ax.set_xlim(-0.8,0.8)
ax.set_ylim(-0.4,2.0)
ax.set_title("Time Breakdown (GPU)")


plt.savefig("pie.pdf", bbox_inches = 'tight', bbox_extra_artists = [legend2])
