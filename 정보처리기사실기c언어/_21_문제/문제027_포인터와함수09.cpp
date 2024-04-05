#include <stdio.h>

void funCount();


int main(void) {
	int num;
	for(num = 0; num < 2; num++)
		funCount();
		
	return 0;
}

void funCount(){
	int num = 0;
	static int count;
	printf("%d %d\n" , ++num, count++);
}

