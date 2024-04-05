
#include <stdio.h>
#include <stdlib.h>

struct person{
    char* name;
    int age;
};

int main(void) {
    // 구조체 pass

    struct person u1;
    u1.name = "A";
    u1.age = 30;
    printf("%s %d\n" , u1.name , u1.age);
    	
    struct person u2;
    u2.name = "B";
    u2.age = 40;
	struct person* p;
	p = &u2;
	printf("%s %d\n" , p->name , p->age);

	return 0;
}


