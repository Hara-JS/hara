#include <stdio.h>

int funa(int n){
	if(n > 1)
        return (n + funa(n - 2));
    else
        return (n % 2);
}

int main(void) {
    int n = 5;
    int result = 0;
    while(true){
        if(n > 1){
            result += n;
            n = n - 2;
        }else{
            n = n % 2;
        	result += n;
        	break;
		}
        
    }
    printf("%d \n" , result);
	return 0;
}


