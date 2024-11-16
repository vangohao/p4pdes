#!/bin/bash

N_values=(200 400 600 800 1000 2000 4000 6000 8000 10000)

for N in "${N_values[@]}"; do

output=$(mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x $N -da_grid_y $N -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -ksp_max_it 200 -ksp_type cg -pc_type icc -pc_factor_levels 0 -log_view -ksp_rtol 0 -use_gpu_aware_mpi 0 -log_view_gpu_time -ksp_monitor_true_residual -ksp_view -ksp_monitor  -initial_gonboundary 1 -fsh_stencil_type 0 | grep "MatSolve")
# 提取需要的字段
value=$(echo "$output" | awk '{print $4}')  # 提取第4列 6.4306e-01
num=$(echo "$output" | awk '{print $2}')    # 提取第2列 201
# 进行计算 6.4306e-01 / 201 / 2
result=$(python -c "print($value/$num/2)")
echo "2D-Star-5P $N $result"

output=$(mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x $N -da_grid_y $N -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1  -ksp_max_it 200 -ksp_type cg -pc_type icc -pc_factor_levels 0 -log_view -ksp_rtol 0 -use_gpu_aware_mpi 0 -log_view_gpu_time -ksp_monitor_true_residual -ksp_view -ksp_monitor  -initial_gonboundary 1 -fsh_stencil_type 1 -fsh_stencil_width 1 | grep "MatSolve")
# 提取需要的字段
value=$(echo "$output" | awk '{print $4}')  # 提取第4列 6.4306e-01
num=$(echo "$output" | awk '{print $2}')    # 提取第2列 201
# 进行计算 6.4306e-01 / 201 / 2
result=$(python -c "print($value/$num/2)")
echo "2D-Box-9P $N $result"

done
