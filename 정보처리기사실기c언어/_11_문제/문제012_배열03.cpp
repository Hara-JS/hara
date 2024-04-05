
#include <stdio.h>

int main(void) {

	char ch[5];
	char str[] = "abcde";
	int num[] = { 1,2,3,4,5 };
	printf("%d, ", sizeof(ch));
	printf("%d, ", sizeof(str));
	printf("%d, ", sizeof(num) / sizeof(int));
	return 0;
}


