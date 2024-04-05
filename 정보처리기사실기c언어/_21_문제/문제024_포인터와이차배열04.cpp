#include <stdio.h>

int main(void) {
	static char *c[] = {"aaa" , "bbb" , "ccc"};
	printf("%s\n" , *(c + 1));
	return 0;
}


