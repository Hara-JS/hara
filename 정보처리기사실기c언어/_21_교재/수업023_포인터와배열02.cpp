#include <stdio.h>

int main(void) {

	int a[4] = {10, 20, 30};
	int *p = a; // p는 arr[0] 의주소
	printf("a[0]=%d, a[1]=%d, a[2]=%d, a[3]=%d\n", a[0], a[1], a[2], a[3]);
	p++; // p는 arr[1] 의 주소
	printf("a[0]=%d, a[1]=%d, a[2]=%d, a[3]=%d\n", a[0], a[1], a[2], a[3]);
	*p++ = 100; // p는 20을 100으로 변경후 arr[2]의 주소로 이동
	printf("a[0]=%d, a[1]=%d, a[2]=%d, a[3]=%d\n", a[0], a[1], a[2], a[3]);
	*++p = 200; // p는 arr[3]의주소로이동후 arr[3]을 200으로변경
	printf("a[0]=%d, a[1]=%d, a[2]=%d, a[3]=%d\n", a[0], a[1], a[2], a[3]);
	return 0;
}

