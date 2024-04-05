#include <stdio.h>
#include <string.h>

int main(void) {
	// 문자열함수 pass

	char str1[20] = "KOREA";
	char str2[20] = "LOVE";
	
	//#include <string.h>
	strcat(str1, str2);  // 이어붙이기

	printf("%s\n", str1);
	printf("%s\n", str2);

	return 0;
}

