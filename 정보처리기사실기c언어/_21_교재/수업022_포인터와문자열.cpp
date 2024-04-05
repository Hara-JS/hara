#include <stdio.h>

int main(void) {

	char str[] = "abcdef";
	// const 값변경이 불가능하다. 
	const char* cpt = "abcdef";

	str[1] = 'x';

	printf("%s", str);

	// 값변경불가능 
	//cpt[1] = 'x';

	return 0;
}

