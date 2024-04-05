#include <stdio.h> 

int main(void) {

	char a = 'a';
	char b = '가'; 
	
	// 한글 은 2byte이기때문에 정상출력되지않는다.
	// 추후 배열로 해결한다.

	printf("%c %c\n", a, b);

	return 0;
}