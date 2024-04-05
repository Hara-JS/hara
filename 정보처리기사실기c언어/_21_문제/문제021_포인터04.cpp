#include <stdio.h>

int main(void) {
	
	// scanf_s 에 90이 입렸됬다고 가정하면 90 20 90이 출력된다. 
	int i = 10;
	int j = 20;
	int* k = &i;
	scanf("%d", k);
	printf("%d %d %d\n", i, j, *k);

	return 0;
}

