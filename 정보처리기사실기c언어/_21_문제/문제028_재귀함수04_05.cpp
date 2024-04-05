#include <stdio.h>

int main(void) {

	int i;
	int j;
	int sum;
	for (i = 5; i >= 0; i--){
		if(i % 2 == 1){
			sum = 1;
			j = i;
			while(true){
				sum *= j;
				if(j == 1){
					break;
				}
				j -= 1;
			}
			printf("%d\n" , sum);
		}		
	}
	return 0;
}



