#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
  openlog(NULL, LOG_PID, LOG_USER);

  // Check if correct number of arguments are provided
  if (argc != 3) {
    syslog(LOG_ERR,
           "Error: Please provide both the file path and the text string.");
    closelog();
    return 1;
  }

  char *writefile = argv[1];
  char *writestr = argv[2];

  // Open the file for writing
  FILE *file = fopen(writefile, "w");
  if (file == NULL) {
    syslog(LOG_ERR, "Error opening file: %s", writefile);
    closelog();
    return 1;
  }

  if (fprintf(file, "%s", writestr) < 0) {
    syslog(LOG_ERR, "Error writing to file: %s", writefile);
    fclose(file);
    closelog();
    return 1;
  }

  fclose(file);

  syslog(LOG_DEBUG, "Writing '%s' to '%s'", writestr, writefile);

  closelog();

  return 0;
}
