
#include <stdio.h>

int main(void) {

	int num[] = { 1,2,3};
	int i = 0;
	for (i = 0; i < 5; i++) { // 3, 4 번째는 쓰래기값이 출력된다.
		printf("%d ", num[i]);
	}
	return 0;
}


