#include <stdio.h>
#include <stdlib.h>

int func(int base, int exp);

int main(void) {
	int res;
	res = func(2, 10);
	printf("main=> %d\n" , res);
	return 0;
}

int func(int base, int exp){
	int res = 1;
	int i =0;
	for (i = 0; i < exp; i++){
		res = res * base;
		printf("%d \n" , res);
	}
	return res;
		
}


