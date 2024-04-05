#include <stdio.h>
#include <stdlib.h>

// 함수전방선언 // 전방선언을 하면 main 밑에 함수를 정의할수있다. 
int func(int n);

int main(void) {
	int num;
	printf("%d\n" , func(5));
	return 0;
}

int func(int n){
	if (n < 2)
		return n;
	else{
		int i, tmp, curent = 1, last =0;
		for (i = 2; i <= n; i++){
			tmp = curent; 
			curent += last;
			last = tmp;
			printf("%d %d %d %d\n" , i , tmp , curent, last);
			// 2 1 1 1
			// 3 1 2 1
			// 4 2 3 2
			// 5 3 5 3
		}
		return curent;
	}
}


