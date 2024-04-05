#include <stdio.h>

int recursion(int n){
	if(n < 5) return 1;
	else if(n % 5 == 1)
		return n + recursion(n-1); // 1 6 11 16
	else recursion(n-1);
}

int main(void) {

    int n = recursion(16);
    printf("%d\n" , n);
	return 0;
}


