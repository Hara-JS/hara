#include <stdio.h>

int main(void) {

	int code = 65;
	int* p = &code;

	// c로 출력 -65하면 된다 ABC.....abc.....
	printf("%c", (*p)++);

	return 0;
}

