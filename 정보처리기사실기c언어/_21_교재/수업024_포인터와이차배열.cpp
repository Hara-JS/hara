#include <stdio.h>
#include <stdlib.h> // srand();
#include <time.h> // time(NULL)

int main(void) {
	int data[][3] = {1, 3, 4, 5, 2, 9, 6, 8, 7};
	int *p = data[1];
	int x, y;
	x = *p;
	y = *(p + 2);
	printf("%d %d\n" , x , y);

	return 0;
}


