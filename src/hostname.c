#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
  // Open the file
  FILE* file = fopen("/etc/hostname", "r");
  if (file == NULL)
  {
    // Print an error message if the file cannot be opened
    fprintf(stderr, "Error: Unable to open file.\n");
    return 1;
  }

  // Read the contents of the file
  char hostname[1024];
  if (fgets(hostname, sizeof(hostname), file) == NULL)
  {
    // Print an error message if the file is empty
    fprintf(stderr, "Error: File is empty.\n");
    return 1;
  }

  // Print the hostname
  printf("%s", hostname);

  // Close the file
  fclose(file);

  return 0;
}
