#include <stdio.h>

int main(void) {
	int arr[] = { 10, 30, 50, 70, 90 };
	int i, max, min;
	max = arr[0];
	min = arr[0];
	
	for (i = 0; i < 5; i++) {
		if (arr[i] > max)
			max = arr[i];
		if (arr[i] < min)
			min = arr[i];
	}

	printf("%d %d", min, max);

	return 0;
}


