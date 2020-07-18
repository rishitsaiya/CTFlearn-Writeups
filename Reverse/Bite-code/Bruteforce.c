#include <stdio.h>
#include <stdlib.h>
#pragma warning (disable : 4146)


void BruteForce()
{
	int flag , x1, x2, x3;
	flag = -2147483648;			// The biggest negative value of 32bit.
	x3 = 0;
	while (x3 != -889275714)
	{
		x1 = flag << 3;
		x2 = flag ^ 525024598;
		x3 = x1 ^x2;
		flag += 1;
	}
	printf("%d \n", flag - 1);
}


void main()
{
	BruteForce();
	system("pause");
}
