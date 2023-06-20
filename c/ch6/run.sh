#!/bin/bash
  ./fish -fsh_dim 2 -da_refine 4 -fsh_problem manupoly -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -pc_type mg -mg_levels_ksp_type richardson -mg_levels_ksp_max_it 1 -pc_mg_levels 3 -ksp_max_it 50 -mg_coarse_ksp_type richardson -mg_coarse_ksp_max_it 1 -mg_coarse_pc_type sor -mat_type aij -ksp_monitor -ksp_monitor_true_residual
  mpiexec -n 4 ./fish -fsh_dim 2 -da_refine 4 -fsh_problem manupoly -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -pc_type mg -mg_levels_ksp_type richardson -mg_levels_ksp_max_it 1 -pc_mg_levels 3 -ksp_max_it 50 -mg_coarse_ksp_type richardson -mg_coarse_ksp_max_it 1 -mg_coarse_pc_type sor -mat_type aij -ksp_monitor -ksp_monitor_true_residual
# ./fish -fsh_dim 2 -da_refine 2 -fsh_problem manupoly -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -pc_type none -mat_type aij -log_view -ksp_monitor -ksp_view
#./fish -fsh_dim 2 -da_refine 2 -fsh_problem manupoly -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -pc_type sor -mat_type aij -log_view -ksp_monitor -ksp_view -ksp_monitor_true_residual -pc_sor_symmetric

# ./fish_$1 -fsh_dim 3 -da_refine 4 -fsh_problem manupoly -ksp_converged_reason -fsh_cx 0.01 -fsh_cy 2 -fsh_cz 100 -pc_type mg -mg_levels_ksp_type richardson -mg_levels_ksp_max_it 1 -pc_mg_levels 4 -ksp_max_it 50 -mg_coarse_ksp_type cg -mg_coarse_ksp_max_it 10 -mg_coarse_pc_type sor -mat_type aij -log_view -ksp_monitor
