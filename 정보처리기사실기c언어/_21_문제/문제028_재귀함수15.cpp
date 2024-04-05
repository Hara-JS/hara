#include <stdio.h>

int fun(int n){
    printf("%d", n );
    if(n < 3) return 1;
    return (fun(n -3) + fun(n -2));
	
}

int main(void) {
    int k;
    k = fun(5);
    printf("%d\n" , k);
	return 0;
}


