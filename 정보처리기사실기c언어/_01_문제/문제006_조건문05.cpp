#include <stdio.h>

int main(void) {

	int score = 85;
	char grade;
	if (score >= 90) grade = 'A';
	if (score >= 80) grade = 'B';
	if (score >= 70) grade = 'C';
	if (score < 70) grade = 'F';
	
	printf("%c\n", grade);

	return 0;
}

