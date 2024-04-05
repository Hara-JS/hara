#include <stdio.h>

int foo();

int main(void) {
	int i = 0, sum = 0;
	while(i < 3){
		sum = sum + foo();
		printf("%d\n" , sum);
		i ++;
	}
	printf("%d\n" , sum);
	return 0;
}

int foo(){
	int var1 = 1;
	static int var2 = 1;
	return (var1++) + (var2++);
}

