#include <stdio.h>

int main(void) {

	int i;
	int j;
	int sum;
	sum = 1;
	j = 5;
	while(true){
		sum *= j;
		if(j == 1){
			break;
		}
		j -= 1;
	}
	printf("%d\n" , sum);

	return 0;
}



