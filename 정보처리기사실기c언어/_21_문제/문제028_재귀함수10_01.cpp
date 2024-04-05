#include <stdio.h>

int funa(int n){
	printf("%d" ,  n);
    if(n > 1)
        funa(n - 1);
    printf("%d\n" , n);
}

int main(void) {
    funa(3);
	return 0;
}


