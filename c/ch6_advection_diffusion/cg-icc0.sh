#!/bin/bash
taskset -c 0-71:2 mpiexec -n 1 ./fish -fsh_dim 3 -da_refine 5 -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -ksp_max_it 2000 -mat_type aij -ksp_monitor -ksp_type cg -pc_type icc -log_view -ksp_monitor_true_residual  -ksp_view -initial_gonboundary 1 -ksp_rtol 1e-5 -pc_factor_levels 0

 #-da_grid_x 32 -da_grid_y 32 -da_grid_z 32 -mat_view