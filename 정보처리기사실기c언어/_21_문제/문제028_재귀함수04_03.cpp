#include <stdio.h>

int func(int num){
	if(num == 1)
		return 1;
	else{
		int a = func(num - 1);
		int result = a * num;
		return result;
	}
}

int main(void) {
	
	int n = func(5);
	printf("%d\n", n);
	
	n = func(3);
	printf("%d\n", n);
	
	n = func(1);
	printf("%d\n", n);
	
	return 0;
}



