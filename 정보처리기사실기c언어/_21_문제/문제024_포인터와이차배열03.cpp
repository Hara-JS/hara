#include <stdio.h>

int main(void) {
	int data[2][3] = {{10,20,30},{40,50,60}};
	printf("%d\n", data);
	printf("%d\n", &data);
	printf("%d\n", data[0]);
	printf("%d\n", *data);
	printf("%d\n", &data[0][0]);
	printf("%d\n", data + 1);
	printf("%d\n", &data + 1);
	printf("%d\n", data[0] + 1);
	printf("%d\n", *data + 1);
	printf("%d\n", &data[0][0] + 1);
	return 0;
}


