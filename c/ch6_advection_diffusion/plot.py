import matplotlib.pyplot as plt

algs = ["jacobi", "gs", "gmres", "ilu", "ilu1"]

plt.figure(figsize=(5,2.5))

linestyles = [(0, (3, 1, 1, 1)), "--", "-.", ":", "-"]

labels = ["Jacobi", "Gauss-Seidel", "GMRES", "GMRES-ILU(0)*", "GMRES-ILU(1)*"]

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
        plt.plot(its, res, label=labels[cnt], linestyle=linestyles[cnt])
        cnt += 1

plt.yscale("log")
plt.legend()
plt.xlim(0, 2000)
plt.ylim(1e-3, 1e0 +0.5)
plt.ylabel("Relative Residual Norm")
plt.xlabel("Number of Iterations")
plt.savefig("plot.pdf", bbox_inches="tight")
