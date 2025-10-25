# Lab Assignment: Backup Script and Mini Shell

This project contains the complete solution for the Lab Assignment, which includes two parts: a Bash backup script and a C-based mini shell.

## Part 1: Backup Script

This part consists of a Bash script (`backup.sh`) that automates the process of creating and maintaining backups for a directory.

*   **Functionality:**
    *   Accepts parameters for source, destination, time interval, and the number of backups to keep.
    *   Periodically creates compressed `.tar.gz` backups.
    *   Automatically removes the oldest backups to ensure only a limited number are stored.

*   **How to Run:**
    The provided `Makefile` is configured to run the script. Simply type the following command in the terminal:
    ```        make run
    ```
    To stop the script, press `Ctrl+C`.

## Part 2: Mini Shell

This is a C program (`mini_shell.c`) that simulates a simple Unix command-line shell.

*   **Functionality:**
    *   Displays a `mini-shell>` prompt.
    *   Reads commands from the user.
    *   Uses `fork()` and `execvp()` to execute the commands.
    *   Waits for each command to finish before prompting for the next one.
    *   Includes a built-in `cd` command (Bonus).
    *   Exits cleanly when the user types `exit`.

*   **How to Run:**
    1.  Compile the program: `gcc mini_shell.c -o mini_shell`
    2.  Execute the compiled program: `./mini_shell`
