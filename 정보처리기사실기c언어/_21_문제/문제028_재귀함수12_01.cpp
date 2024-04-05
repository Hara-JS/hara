#include <stdio.h>

int recur(int a, int b){
	if(a <= 1)
		return a * b;
	else
		return a * recur(a-1, b+1) + recur(a-1, b);
}

int main(void) {
    int a = 3, b = 2;
    printf("%d \n", recur(a, b) );
	return 0;
}


