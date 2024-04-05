#include <stdio.h>

int recur(int a, int b){
	if(a <= 1){
		return a * b;
	}	
	else{
		int result = a;
		int r1 = recur(a-1, b+1);
		int r2 = recur(a-1, b);
		result = a * r1 + r2;
		return result;
	}		
}

int main(void) {
    int a = 3, b = 2;
    printf("%d \n", recur(a, b) );
	return 0;
}


