
#include <stdio.h>
#include <stdlib.h>

struct person
{
    char name[10];
    int age;
};


int main(void) {
    struct person s[] = 
    {"Kim" , 28, "Lee" , 38 , "Seo" , 50 , "Park" , 35};
    struct person *p;
    p = s;
    p ++;
    printf("%s\n" , p->name);
    printf("%d\n" , p->age);
	return 0;
}


