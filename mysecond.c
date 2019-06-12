/* A gettimeofday routine to give access to the wall
   clock timer on most UNIX-like systems.

   This version defines two entry points -- with
   and without appended underscores, so it *should*
   automagically link with FORTRAN */

#include <sys/time.h>
#include <unistd.h>

double mysecond()
{
    uint32_t lo, hi;
    __asm__ __volatile__("rdtsc" : "=a" (lo), "=d" (hi));
    uint64_t tsc = ((uint64_t)hi << 32) | lo;
    return tsc / sysconf(_SC_CLK_TCK);
}

double mysecond_() {return mysecond();}

