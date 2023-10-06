#include <stdlib.h>
#include <stdio.h>

int main(){
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stdin, NULL, _IONBF, 0);

	int acc = 0;
	int n;
	while (acc >= 0){
		printf("acc = %d\n", acc);
		printf("Enter a number: ");

		if (scanf("%d", &n) != 1){
			puts("Error reading integer");
		} else {
			if (n < 0){
				puts("You can't enter the negative number!");
			} else {
				acc += n;
			}
		}
	}
	
    printf("You win! acc = %d\n", acc);
	system("cat ./flag.txt");
}
