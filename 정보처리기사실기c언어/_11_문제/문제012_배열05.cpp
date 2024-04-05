#include <stdio.h>

int main(void) {

	char msg[50] = "Hello World! Good Luck!";
	int i = 2, number = 0;
	while (msg[i] != '!') {
		if (msg[i] == 'a' || msg[i] == 'e' || msg[i] == 'i' || msg[i] == 'o' || msg[i] == 'u')
			number++;
		i++;
	}  
	printf("%d ", number);

	return 0;
}


