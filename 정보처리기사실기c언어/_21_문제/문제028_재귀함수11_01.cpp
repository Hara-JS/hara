#include <stdio.h>

int fun(int a, int b, int c){
	if(c != 0){
        fun(b, a + b, c-1);
        printf("%d %d %d\n" , a, b, c);
    }
}

int main(void) {
    int i = 1;
    int j = 1;
    int k = 3;
    fun(i, j, k);
	return 0;
}


