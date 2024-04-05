#include <stdio.h>

void align(int a[]) {
	// 버블정렬 
	int temp;
	int i;
	int j;
	for (i = 0; i < 4; i++) {
		for (j = 0; j < 4 - i; j++) {
			if (a[j] > a[j + 1]) {
				temp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = temp;
			}
		}
	}
}

int main(void) {

	int a[] = { 85, 75, 50, 100, 95 };
	align(a);
	int i;
	for (i = 0; i < 5; i++)
		printf("%d ", a[i]);
	return 0;
}

