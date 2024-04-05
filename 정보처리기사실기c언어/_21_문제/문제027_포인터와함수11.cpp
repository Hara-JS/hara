#include <stdio.h>

int funcA(int n){
	static int s = 1;
	s *= n;
	return s;
}

int funcB(int n){
	int s = 1;
	s *= n;
	return s;
}

int main(void) {
	int s1, s2;
	s1 = funcA(2);
	printf("%d\n" , s1);
	
	s1 = funcA(3);
	printf("%d\n" , s1);
	
	s2 = funcB(2);
	printf("%d\n" , s2);
	
	s2 = funcB(3);
	printf("%d\n" , s2);
	
	return 0;
}


