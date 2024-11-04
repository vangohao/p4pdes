#!/bin/bash
 taskset -c 0-71:2 mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x 512 -da_grid_y 512 -fsh_problem manupoly -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -pc_type none -ksp_max_it 2000 -mat_type aij -ksp_monitor -ksp_type cg -ksp_viewi -pc_type none -log_view -ksp_monitor_true_residual
