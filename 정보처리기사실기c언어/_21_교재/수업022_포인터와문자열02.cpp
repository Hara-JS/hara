#include <stdio.h>

int main(void) {

	const char* p = "KOREA";
	printf("%s\n", p);
	printf("%s\n", p + 3);
	printf("%c\n", *p);
	printf("%c\n", *(p + 3));
	printf("%c\n", *p + 2); // KLM
	printf("%c\n", (*p) + 2);// KLM
	return 0;
}

