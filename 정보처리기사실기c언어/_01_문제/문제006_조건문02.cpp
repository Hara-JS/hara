#include <stdio.h>

int main(void) {

	int i = 3;
	int j = 4;
	
	if ((++i > j--) || (i++ < --j)) i = i-- + ++j;
	else j = i-- - --j;
	
	printf("%d %d\n", i, j);
	return 0;
}

