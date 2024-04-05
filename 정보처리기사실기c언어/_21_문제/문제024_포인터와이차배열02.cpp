#include <stdio.h>

int main(void) {
	int data[3][3] = {{10,20,30},{40,50,60},{70,80,90}};
	int sum1, sum2;
	int n = *(*data + 1);
	int n2 = *(*data + 2);
	int n3 = *data[1];
	int n4 = *data[2];	
	
	sum1 = n + n2;
	sum2 = n3 + n4;
	
	printf("%d\n", n);
	printf("%d\n", n2);
	printf("%d\n", n3);
	printf("%d\n", n4);
	printf("%d %d\n" , sum1 , sum2);

	return 0;
}


