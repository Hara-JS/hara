#include <stdio.h>

int func(int n){
    if(n % 2 == 1)
        n = n - 1;
    if (n == 0)
        return 0;
    int result = func(n - 2);
    result += n; // 18 16 14 12 10 8 6 4 2 
    return result;
}

int main(void) {
    int result = 0;
    int n = 19;
    while(true){
		if(n % 2 == 1){
			n = n - 1;
		}
		if(n == 0){
    		break;
		}
		result += n;
		n -= 2;
		
	}
    
    printf("%d\n" , result);
	return 0;
}


