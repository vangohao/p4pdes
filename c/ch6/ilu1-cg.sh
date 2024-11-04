#!/bin/bash
 taskset -c 0-71:2 mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x 2048 -da_grid_y 2048 -fsh_problem manupoly -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -pc_type none -ksp_max_it 200 -mat_type aij -ksp_type cg -ksp_gmres_restart 100 -pc_type ilu -pc_factor_levels 1 -log_view -ksp_rtol 0
#-ksp_monitor_true_residual -ksp_view -ksp_monitor 