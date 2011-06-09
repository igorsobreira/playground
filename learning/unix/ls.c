#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  DIR *dp;
  struct dirent *dirp;

  if (argc != 2) {
    fprintf(stderr, "Usage: ls dir_name\n");
    return 1;
  }

  if ((dp = opendir(argv[1])) == NULL) {
    fprintf(stderr, "Can't open %s\n", argv[1]);
    return 1;
  }

  while ((dirp = readdir(dp)) != NULL) {
    printf("%s\n", dirp->d_name);
  }

  closedir(dp);
  return 0;
}
