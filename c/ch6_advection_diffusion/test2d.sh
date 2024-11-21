#!/bin/bash
mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x 1025 -da_grid_y 1025 -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -ksp_max_it 200000 -mat_type aij -ksp_monitor  -log_view -ksp_monitor_true_residual  -ksp_view -initial_gonboundary 1 -ksp_rtol 1e-3 -pc_factor_levels 0 \
 -ksp_type cg -pc_type icc -pc_sor_forward -ksp_norm_type unpreconditioned -snes_monitor |tee test-1025-cg.out | grep "Linear solve converged" &

mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x 1025 -da_grid_y 1025 -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -ksp_max_it 200000 -mat_type aij -ksp_monitor  -log_view -ksp_monitor_true_residual  -ksp_view -initial_gonboundary 1 -ksp_rtol 1e-3 -pc_factor_levels 0 \
 -ksp_type richardson -pc_type sor -pc_sor_forward -ksp_norm_type unpreconditioned -snes_monitor |tee test-1025-sor.out | grep "Linear solve converged" &

mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x 1025 -da_grid_y 1025 -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -ksp_max_it 200000 -mat_type aij -ksp_monitor  -log_view -ksp_monitor_true_residual  -ksp_view -initial_gonboundary 1 -ksp_rtol 1e-3 -pc_factor_levels 0 \
 -ksp_type richardson -pc_type jacobi -pc_sor_forward -ksp_norm_type unpreconditioned -snes_monitor |tee test-1025-jacobi.out | grep "Linear solve converged" &


mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x 2049 -da_grid_y 2049 -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -ksp_max_it 200000 -mat_type aij -ksp_monitor  -log_view -ksp_monitor_true_residual  -ksp_view -initial_gonboundary 1 -ksp_rtol 1e-3 -pc_factor_levels 0 \
 -ksp_type cg -pc_type icc -pc_sor_forward -ksp_norm_type unpreconditioned -snes_monitor |tee test-2049-cg.out | grep "Linear solve converged" &

mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x 2049 -da_grid_y 2049 -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -ksp_max_it 200000 -mat_type aij -ksp_monitor  -log_view -ksp_monitor_true_residual  -ksp_view -initial_gonboundary 1 -ksp_rtol 1e-3 -pc_factor_levels 0 \
 -ksp_type richardson -pc_type sor -pc_sor_forward -ksp_norm_type unpreconditioned -snes_monitor |tee test-2049-sor.out | grep "Linear solve converged" &

mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x 2049 -da_grid_y 2049 -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -ksp_max_it 200000 -mat_type aij -ksp_monitor  -log_view -ksp_monitor_true_residual  -ksp_view -initial_gonboundary 1 -ksp_rtol 1e-3 -pc_factor_levels 0 \
 -ksp_type richardson -pc_type jacobi -pc_sor_forward -ksp_norm_type unpreconditioned -snes_monitor |tee test-2049-jacobi.out | grep "Linear solve converged" &


mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x 4097 -da_grid_y 4097 -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -ksp_max_it 200000 -mat_type aij -ksp_monitor  -log_view -ksp_monitor_true_residual  -ksp_view -initial_gonboundary 1 -ksp_rtol 1e-3 -pc_factor_levels 0 \
 -ksp_type cg -pc_type icc -pc_sor_forward -ksp_norm_type unpreconditioned -snes_monitor |tee test-4097-cg.out | grep "Linear solve converged" &

mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x 4097 -da_grid_y 4097 -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -ksp_max_it 200000 -mat_type aij -ksp_monitor  -log_view -ksp_monitor_true_residual  -ksp_view -initial_gonboundary 1 -ksp_rtol 1e-3 -pc_factor_levels 0 \
 -ksp_type richardson -pc_type sor -pc_sor_forward -ksp_norm_type unpreconditioned -snes_monitor |tee test-4097-sor.out | grep "Linear solve converged" &

mpiexec -n 1 ./fish -fsh_dim 2 -da_grid_x 4097 -da_grid_y 4097 -fsh_problem manuexp -ksp_converged_reason -fsh_cx 1 -fsh_cy 1 -fsh_cz 1 -ksp_max_it 200000 -mat_type aij -ksp_monitor  -log_view -ksp_monitor_true_residual  -ksp_view -initial_gonboundary 1 -ksp_rtol 1e-3 -pc_factor_levels 0 \
 -ksp_type richardson -pc_type jacobi -pc_sor_forward -ksp_norm_type unpreconditioned -snes_monitor |tee test-4097-jacobi.out | grep "Linear solve converged" &

# -snes_monitor_residual
# -ksp_type cg -pc_type icc
# -ksp_type richardson -pc_type jacobi
# -ksp_type richardson -pc_type sor
# 130 1025

 #-da_grid_x 32 -da_grid_y 32 -da_grid_z 32 -mat_view

wait