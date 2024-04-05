#include <stdio.h>

int main(void) {
    int n = 16;
    int result = 0;
    while(true){
    	if(n < 5){
    		result += 1;
    		break;
		}else if(n % 5 == 1){
			result += n;
		}
		n -= 1;
	}
    
    printf("%d\n" , result);
	return 0;
}


