
#include <stdio.h>

int main(void) {
	
	int a = 0, b = 1;
	switch (a) {
		case 0: printf("%d\n", b++); break;
		case 1: printf("%d\n", ++b); break;
		case 2: printf("%d\n", b); break;
	}

	return 0;
}


