#include <stdio.h>

int change(int n) {
	n = 20;
	return n;
}

int main(void) {
	int n = 10;
	printf("%d\n", n);
	// 리턴으로 함수를 이용해 변수값을 변경할수있다. 
	n = change(n);
	printf("%d\n", n);
	return 0;
}

