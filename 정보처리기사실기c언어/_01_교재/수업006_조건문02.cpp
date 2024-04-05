#include <stdio.h>

int main(void) {

	int i = 3;
	int j = 4;
	bool check = (++i > j--);
	printf("%d\n", check);
	printf("%d %d\n", i, j);

	bool check2 = (i++ < --j);
	printf("%d\n", check2);
	printf("%d %d\n", i, j);

	j = i-- - --j;
	printf("%d %d\n", i, j);

	return 0;
}

