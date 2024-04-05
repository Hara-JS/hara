#include <stdio.h>
int main(void) {
	int i = 7, j = 9;
	int k;
	/*
	if (i > j)
		k = i - j;
	else
		k = i + 1;
	*/
	/*
		위 식을 삼항연산자로변경
	*/

	k = (i > j) ? i - j : i + j;

	printf("%d", k);

	return 0;
}


