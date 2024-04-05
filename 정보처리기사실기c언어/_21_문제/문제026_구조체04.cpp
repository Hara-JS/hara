
#include <stdio.h>
#include <stdlib.h>

struct jsu
{
    char name[12];
    int os, db, hab, hhab;
};


int main(void) {
    struct jsu st[3] = {
    	{"데이터1", 10, 20},
		{"데이터2", 30, 40},
		{"데이터3", 50, 60},
	}; 
    
    struct jsu* p;
	p = &st[0];
	
	(p + 1)->hab = (p + 1)->os + (p + 2)->db;
	(p + 1)->hhab = (p + 1)->hab + p->os + p->db;
	printf("%d \n" , (p + 1)->hab ); 
	printf("%d \n" , (p + 1)->hhab); 
    
	return 0;
}


