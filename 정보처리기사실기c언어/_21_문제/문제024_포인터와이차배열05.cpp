#include <stdio.h>

int main(void) {
	char* array1[2] = {
		"Good morning" , "C language"
	};
	printf("%s\n", array1[0] + 5);
	printf("%s\n", array1[1] + 6);
	return 0;
}


