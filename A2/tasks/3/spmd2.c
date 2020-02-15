/* spmd2.c
* ... illustrates the SPMD pattern in OpenMP,
* using the commandline arguments
* to control the number of threads.
*
* Joel Adams, Calvin College, November 2009.
*
* Usage: ./spmd2 [numThreads]
*
* Exercise:
* - Compile & run with no commandline args
* - Rerun with different commandline args
*/

#include <stdio.h>
#include <omp.h>
#include <stdlib.h>

int main(int argc, char** argv) {
    //int id, numThreads;   //variables must be locals

    printf("\n");
    
    if (argc > 1) {
        omp_set_num_threads( atoi(argv[1]) );
    }

    #pragma omp parallel
    {
        int id = omp_get_thread_num();             // using id local variable
        int numThreads = omp_get_num_threads();    // using id local variable
        printf("Hello from thread %d of %d\n", id, numThreads);
    }

    printf("\n");
    
    return 0;
}