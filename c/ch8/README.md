c/ch8/
======

This directory contains scripts, including an example batch script `cluster.sh`,
which runs codes from the book _PETSc for Partial Differential Equations_ on a
Linux cluster.  This example might be useful as a suggestion for how
PETSc codes are run in a batch system on many-node machines, but users should
expect to make modifications for their own machines.

The particular settings are for a modest-sized Linux cluster `chinook` at the
University of Alaska Fairbanks; see
   https://www.gi.alaska.edu/services/research-computing-systems.
Access to `chinook` is generally limited to UAF students and faculty.

The script `genweak.py` generates batch scripts suitable for the weak-scaling
study in Chapter 8 of the book.
