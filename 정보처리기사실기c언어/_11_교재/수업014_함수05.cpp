
#include <stdio.h>
#include <stdlib.h>

void swap(int a, int b){
	int temp;
	temp = a;
	a = b;
	b = temp;
}


int main(void) {
	int k, j;
	k = 3;
	j = 2;
	swap(k, j);
	printf("%d %d \n", k, j); // 값이 안바뀜 
   
	return 0;
}


