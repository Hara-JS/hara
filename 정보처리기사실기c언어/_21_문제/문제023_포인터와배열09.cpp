#include <stdio.h>

int main(void) {

	int code[] = {10, 20, 30, 0};
	int*p = code;
	
	printf("%d\n" , ++*p);
	printf("%d\n" , *p++);
	printf("%d\n" , *++p);
	printf("%d\n" , (*p)++);	
	printf("%d\n" , *(p++));
	printf("%d\n" , *p);
	return 0;
}

