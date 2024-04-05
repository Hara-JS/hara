#include <stdio.h>
int f(int n){
    if(n > 0){
    	int r1 = n % 10;
    	int r2 = f(n / 10);
    	int r3 = r1 + r2;
    	return r3;
	} 
    else
        return 0;
}

int main(void) {
	int result;
    result = f(123);
    printf("%d\n" , result);
	return 0;
}


