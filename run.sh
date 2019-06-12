#!/bin/bash

# likwid-pin will automatically set OMP_NUM_THREADS to #threads specified.
NUM_THREADS=$1
likwid-pin -c N:0-$((NUM_THREADS-1)) ./stream
likwid-pin -c N:0-$((NUM_THREADS-1)) ./stream.tuned
