#include <stdio.h>
#include <stdlib.h> // srand();
#include <time.h> // time(NULL)

int main(void) {
	
	int ary[3];
	int s = 0;
	int i = 0;
	*(ary + 0) = 1;
	ary[1] = *(ary + 0) + 2;
	ary[2] = *ary + 3;
	
	for(i = 0; i < 3; i++){
		s = s + ary[i];
	}
	
	printf("%d\n" , s);
	 


	return 0;
}


