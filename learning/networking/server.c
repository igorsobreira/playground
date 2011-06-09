/*
 * Simple socket server, No error handling 
 */
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>

int main(int argc, char *argv[]) {
    
    int sockfd, clifd, n;
    int port = 8000;
    char buffer[256];
    struct sockaddr_in serv_addr, cli_addr;
    socklen_t clilen = sizeof(cli_addr);
    
    sockfd = socket(AF_INET, SOCK_STREAM, 0);

    // sets all values in the buffer to zero
    bzero(&serv_addr, sizeof(serv_addr));

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(port);

    bind(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr));
    listen(sockfd, 5);

    printf("listening\n");
    clifd = accept(sockfd, (struct sockaddr *)&cli_addr, &clilen); 

    bzero(buffer, 256);
    while (1) {
        n = read(clifd, buffer, 255);
        printf("[received %d bytes] %s\n", n, buffer);
    }
    close(sockfd);
    close(clifd);

    return 0;
}
