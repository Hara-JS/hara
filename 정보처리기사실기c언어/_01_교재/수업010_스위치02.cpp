
#include <stdio.h>

int main(void) {
	/*
		break를 생략하면 조건에 걸리는 곳부터 break를 만날때까지 전부 실행한다. 
	*/
	int a = 1, b = 1;
	switch (a) {
		case 0: printf("(0)%d\n", b++); 
		case 1: printf("(1)%d\n", ++b); 
		case 2: printf("(2)%d\n", b++); 
		case 3: printf("(3)%d\n", ++b); break;
		case 4: printf("(4)%d\n", b++); 
	}

	return 0;
}


