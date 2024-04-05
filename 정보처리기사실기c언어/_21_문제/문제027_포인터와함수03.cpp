#include <stdio.h>
#include <stdlib.h>

void swap(int a, int *b);

int main(void) {
	int value = 3, list[4] = {1, 3, 5, 8};
	int i;
	
	swap(value , &list[0]);
	
	for (i = 0; i < 4; i++)
		printf("%d " , list[i]);
	
	printf("\n");
	
	swap(list[2], &list[3]);
		
	for (i = 0; i < 4; i++)
		printf("%d " , list[i]);
	printf("\n");	
	
	swap(value, &list[value]);	
	
	for (i = 0; i < 4; i++)
		printf("%d " , list[i]);
	return 0;
}

void swap(int a, int *b){
	int temp;
	temp = a;
	a = *b;
	*b = temp;
}


