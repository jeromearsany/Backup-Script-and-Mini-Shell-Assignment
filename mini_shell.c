#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>

#define MAX_LINE 80

int main(void) {
    char *args[MAX_LINE/2 + 1];
    int should_run = 1;

    while (should_run) {
        printf("mini-shell> ");
        fflush(stdout);

        char input[MAX_LINE];
        fgets(input, MAX_LINE, stdin);

        char *token = strtok(input, " \n\t");
        int i = 0;
        while (token != NULL) {
            args[i] = token;
            i++;
            token = strtok(NULL, " \n\t");
        }
        args[i] = NULL;

        if (args[0] == NULL) {
            continue;
        }

        if (strcmp(args[0], "exit") == 0) {
            should_run = 0;
            continue;
        }

        if (strcmp(args[0], "cd") == 0) {
            if (args[1] == NULL) {
                fprintf(stderr, "cd: expected argument\n");
            } else {
                if (chdir(args[1]) != 0) {
                    perror("cd failed");
                }
            }
            continue;
        }

        pid_t pid = fork();

        if (pid == 0) {
            // Child process
            if (execvp(args[0], args) == -1) {
                perror("Command execution failed");
                exit(1);
            }
        } else if (pid > 0) {
            // Parent process
            wait(NULL);
        } else {
            perror("Fork failed");
        }
    }
    return 0;
}
