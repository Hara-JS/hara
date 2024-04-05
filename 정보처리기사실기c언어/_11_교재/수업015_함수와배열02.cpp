#include <stdio.h>

void temp(int arr[]) {
	arr[0] = 100;
	arr[1] = 200;
	arr[2] = 300;
}

int main(void) {

	int arr[] = { 10, 20, 30 };
	int i = 0;
	for (i = 0; i < 3; i++)
		printf("%d ", arr[i]);
	printf("\n\n\n");

	// 배열은 수정이 된다. 
	temp(arr);

	for(i = 0; i < 3; i++)
		printf("%d ",arr[i]);
	printf("\n\n\n");

	return 0;
}

