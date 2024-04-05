#include <stdio.h>
#include <stdlib.h>

int r1(){
	return 4;
} 

int r10(){
	int n1 = 30;
	int n2 = r1();
	return n1 + n2;
}

int r100(){
	int n1 = 200;
	int n2 = r10();
	return n1 + n2;
}

int main(void) {
	int n = r100();
	printf("%d \n", n); // 값이 안바뀜   
	return 0;
}


