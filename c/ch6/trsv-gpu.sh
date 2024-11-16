#!/bin/bash
N=$1
echo "Star-7p"
taskset -c 0-71:2 mpiexec -n 1 ./fish -fsh_dim 3 -da_grid_x $N -da_grid_y $N -da_grid_z $N -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1  -fsh_cz 1 -ksp_max_it 200 -mat_type aijcusparse -ksp_type cg -pc_type icc -pc_factor_levels 0 -log_view -ksp_rtol 0 -dm_vec_type cuda -pc_factor_mat_solver_type cusparse -use_gpu_aware_mpi 0 -log_view_gpu_time -ksp_monitor_true_residual -ksp_view -ksp_monitor  -initial_gonboundary 1  -fsh_stencil_type 0 | grep "MatSolve"

echo "Box-27p"
taskset -c 0-71:2 mpiexec -n 1 ./fish -fsh_dim 3 -da_grid_x $N -da_grid_y $N -da_grid_z $N -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1  -fsh_cz 1 -ksp_max_it 200 -mat_type aijcusparse -ksp_type cg -pc_type icc -pc_factor_levels 0 -log_view -ksp_rtol 0 -dm_vec_type cuda -pc_factor_mat_solver_type cusparse -use_gpu_aware_mpi 0 -log_view_gpu_time -ksp_monitor_true_residual -ksp_view -ksp_monitor  -initial_gonboundary 1  -fsh_stencil_type 1 | grep "MatSolve"