#include <stdio.h>

int sum() {
	// 숫자 0부터 n까지 n을포함한 합을구하시오. 
	int result = 0;
	int i = 0;
	int n;
	scanf("%d", &n);
	for (i = 0; i <= n; i++) {
		result += i;
	}
	return result;
}

int main(void) {

	int result = sum();
	printf("%d", result);
	return 0;
}

