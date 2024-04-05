#include <stdio.h>

int main(void) {

    int i = 5;
    int j = 14;
    
    while(true){
    	if(i < 3) {
    		i = j = 1;
    		break;
		}else{
			i = i-1;
			j = j-1;
			printf("%d %d\n" , i, j);
		}
	}
	return 0;
}


