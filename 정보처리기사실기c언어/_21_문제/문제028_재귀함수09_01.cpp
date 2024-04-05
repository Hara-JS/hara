#include <stdio.h>

int funa(int n){
	if(n > 1)
        return (n + funa(n - 2));
    else
        return (n % 2);
}

int main(void) {
    printf("%d %d\n" , funa(5) , funa(6));
	return 0;
}


