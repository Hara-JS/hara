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

	int i;
	for (i = 5; i >= 0; i--){
		if(i % 2 == 1)
			printf("%d %d\n", i , func(i));
	}

	return 0;
}



