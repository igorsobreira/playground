#include <stdio.h>
#include <mpi.h>

int main (int argc, char **argv) {
    
    int quantos, rank;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &quantos);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    printf("Hello world, I'm process %d from %d running.\n", rank+1, quantos);
    
    MPI_Finalize();

    return 0;
}
