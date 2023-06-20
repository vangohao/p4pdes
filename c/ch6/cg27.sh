#!/bin/bash
mpiexec -n 27 ./fish -fsh_dim 3 -da_grid_x 384 -da_grid_y 384 -da_grid_z 384 -fsh_problem manupoly -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -pc_type none -ksp_max_it 10 -mat_type aij -ksp_monitor -ksp_type cg -ksp_view -log_view
