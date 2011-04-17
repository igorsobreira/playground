
#include <stdio.h>
#include <mpi.h>

#define TAG 1

int main (int argc, char **argv) {
    
    int quantos, rank, v;
    
    MPI_Init(&argc, &argv);
    
    MPI_Status status;
    MPI_Comm_size(MPI_COMM_WORLD, &quantos);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    if ( rank == 0 ) {
        printf("Type an integer: ");
        fflush(stdout);
        scanf("%d", &v);

        MPI_Send(&v, 1, MPI_INT, 1, TAG, MPI_COMM_WORLD);
        MPI_Recv(&v, 1, MPI_INT, 1, TAG, MPI_COMM_WORLD, &status);
        printf("Value sent from process 1 was: %d\n", v);
        fflush(stdout);

    } else if ( rank == 1 ) {
        MPI_Recv(&v, 1, MPI_INT, 0, TAG, MPI_COMM_WORLD, &status);
        v = v*v;
        MPI_Send(&v, 1, MPI_INT, 0, TAG, MPI_COMM_WORLD);
    }

    MPI_Finalize();

    return 0;
}
