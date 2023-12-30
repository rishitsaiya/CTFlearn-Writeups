#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int menu() {
  printf("*** WINBLOWS LOGIN *********\n"
      "1. Login into user.\n"
      "2. Sign out.\n"
      "3. Print flag.\n"
      "4. Lock user.\n"
      "5. Restore user.\n"
      "> ");
  
  int resp = 0;
  scanf("%d", &resp);
  while (getchar() != '\n');
  return resp;
}

struct creds {
  void *padding;
  char name[32];
  int admin;
};


struct creds *curr;
struct creds *save;

char *fake_flag;

int main() {
  char buff[64];

  setbuf(stdout, NULL);
  setbuf(stdin, NULL);

  while (1) {
    switch (menu()) {
      case 1:  // Login
        curr = malloc(sizeof(*curr));

        printf("Username: ");
        fgets(curr->name, sizeof(curr->name), stdin);
        strtok(curr->name, "\n");

        curr->admin = 0;
        break;
      case 2: // Sign out
        if (!curr) {
          puts("You are not logged in!");
          break;
        }
        free(curr);
        curr = NULL;
        puts("You have been successfully logged out.");
        break;
      case 3: // Print flag
        if (curr && curr->admin) {
          puts("Here's your flag:");
          system("/bin/cat /flag.txt");
        } else {
          if (!fake_flag) {
            puts("You are not admin. Would you like to create a new flag instead?");
            fgets(buff, sizeof(buff), stdin);
            fake_flag = strdup(buff);
          }
          printf("Here's your flag: %s", fake_flag);
        }
        break;
      case 4: // Lock user
        if (curr == NULL) {
          puts("You are not logged in!");
          break;
        }

        puts("User has been locked now.");
        save = curr;
        break;
      case 5: // Restore user
        if (curr != NULL) {
          puts("You are already logged. Sign out first!");
        } else if (save == NULL) {
          puts("No user is currently locked!");
        } else {
          printf("Welcome back, %s!\n", save->name);
          curr = save;
          save = NULL;
        }
        break;
      default:
        puts("Invalid choice");
    }
  }
}
