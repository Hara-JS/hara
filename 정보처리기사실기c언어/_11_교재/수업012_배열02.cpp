#include <stdio.h>
int main(void) {

	//sizeof() 함수 // 메모리 크기를 반환해준다. 
	char ch;
	char chList[5];
	char str[] = "abcde"; // 눈에는 안보이지만 \0 이 추가로 저장된다. 
	int n;
	int arr[] = { 1,2,3,4,5 };

	printf("ch ==> %d\n", sizeof(ch)); // 1
	printf("chList ==> %d\n", sizeof(chList)); // 5
	printf("str ==> %d\n", sizeof(str)); // 6
	printf("n ==> %d\n", sizeof(n)); // 4
	printf("arr ==> %d\n", sizeof(arr) ) ; // 20 
	printf("arr개수 ==> %d", sizeof(arr) / sizeof(int)); // 5
	return 0;
}


