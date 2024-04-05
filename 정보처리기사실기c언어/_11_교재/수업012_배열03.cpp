#include <stdio.h>
int main(void) {

	
	char str[] = "abcde";
	char str2[] = "qwert";
	int i = 0;
	printf("%s\n", str); 


	for (i = 0; str2[i] != '\0'; i++) {
		printf("%c", str2[i]);
	}
	

	return 0;
}


