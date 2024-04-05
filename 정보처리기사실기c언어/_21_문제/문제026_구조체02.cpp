
#include <stdio.h>
#include <stdlib.h>

int main(void) {
    // pass
    struct list{

        int * pt;

    }data, *p;
    
    int x[] = {100, 200, 300, 400};
    p = &data;
    p->pt = x + 1;
    printf("%d" , *(++p->pt));

	return 0;
}


