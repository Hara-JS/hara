#include <stdio.h>
#include <string.h>

// 문자열문제는 pass 

int main(void) {

	char str1[20] = "KOREA";
	char str2[20] = "LOVE";
	char* p1 = NULL;
	char* p2 = NULL;
	p1 = str1;
	p2 = str2;
	str1[1] = p2[2];
	str2[3] = p1[4];

	// #include <string.h>

	strcat(str1, str2);  // 이어붙이기 
	printf("%s\n" , str1);
	printf("%s\n" , str2); 
	printf("%c" , *(p1+ 2));
	return 0;
}

