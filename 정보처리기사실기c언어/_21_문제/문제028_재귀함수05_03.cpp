#include <stdio.h>

int main(void) {
    int n  = 123;
    int result = 0;
    while(true){
		if(n > 0){
			result += n % 10;
			n = n / 10;
		}else{
			break;
		}	
	}
    printf("%d\n" , result);
	return 0;
}


