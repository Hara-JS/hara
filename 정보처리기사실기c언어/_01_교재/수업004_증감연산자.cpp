
#include <stdio.h> 

int main(void) {

	/*
		증감연산자 

		앞증가 연산자 ++a;
		뒷증가 연산자 a++;

		앞감소 연산자 --a;
		뒷감소 연산자 a--;

		[1] 앞 증감연산자는 = (대입연산자) 보다 우선순위가 높다.
		[2] 뒷 증감연산자는 = (대입연산자) 보다 우선순위가 낮다. 
	*/
	int a, b, c, d;
	a = 1;
	b = 2;
	c = 10;
	d = 20;
	
	printf("%d\n", a++);
	printf("%d\n", a);

	printf("%d\n", b--);
	printf("%d\n", b);

	printf("%d\n", ++c);
	printf("%d\n", c);

	printf("%d\n", ++d);
	printf("%d\n", d);
	
	return 0;
}
