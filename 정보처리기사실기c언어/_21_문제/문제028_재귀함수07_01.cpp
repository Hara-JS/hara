#include <stdio.h>

int func(int i, int j){
    if(i < 3) i = j = 1;
    else{
        i = i-1;
        j = j-1;
        printf("%d %d" , i, j);
        return func(i, j);
    }
}

int main(void) {
    func(5, 14);
    
	return 0;
}


