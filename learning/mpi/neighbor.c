
#include <stdio.h>
#include <mpi.h>

#define TAG 1

int main (int argc, char **argv) {
    
    int quantos, rank, next_neighbor=1, prev_neighbor=3;
    int v = 1;

    MPI_Init(&argc, &argv);
    
    MPI_Status status;
    MPI_Comm_size(MPI_COMM_WORLD, &quantos);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    
    if ( rank == 0 ) {
        prev_neighbor = 3;
        next_neighbor = rank + 1;

        MPI_Send(&v, 1, MPI_INT, next_neighbor, TAG, MPI_COMM_WORLD);
        MPI_Recv(&v, 1, MPI_INT, prev_neighbor, TAG, MPI_COMM_WORLD, &status);

        printf("I'm process %d -> Hello from %d\n", rank, prev_neighbor);
        fflush(stdout);
    }
    else if ( rank == 1 || rank == 2) {
        prev_neighbor = rank - 1;
        next_neighbor = rank + 1;

        MPI_Send(&v, 1, MPI_INT, next_neighbor, TAG, MPI_COMM_WORLD);
        MPI_Recv(&v, 1, MPI_INT, prev_neighbor, TAG, MPI_COMM_WORLD, &status);

        printf("I'm process %d -> Hello from %d\n", rank, prev_neighbor);
        fflush(stdout);
    }
    else if ( rank == 3) {
        prev_neighbor = rank - 1;
        next_neighbor = 0;

        MPI_Send(&v, 1, MPI_INT, next_neighbor, TAG, MPI_COMM_WORLD);
        MPI_Recv(&v, 1, MPI_INT, prev_neighbor, TAG, MPI_COMM_WORLD, &status);

        printf("I'm process %d -> Hello from %d\n", rank, prev_neighbor);
        fflush(stdout);
    }
    
    MPI_Finalize();
    return 0;
}
