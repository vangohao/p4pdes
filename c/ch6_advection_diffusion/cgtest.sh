#!/bin/bash
./cg.sh | tee cg.out
./cg-icc0.sh | tee cg-icc0.out
./cg-icc1.sh | tee cg-icc1.out
./jacobi.sh | tee jacobi.out
./gs.sh | tee gs.out
./cg-icc0-gpu.sh | tee cg-icc0-gpu.out
./cg-icc1-gpu.sh | tee cg-icc1-gpu.out