#include <stdio.h>
 
int fat(int n) {
    int fat_int, i;
    fat_int = 1;
    for (i = 1; i <= n; i = i + 1) fat_int = fat_int * i;
    return fat_int;
}

int main()
{
	int n;
	printf("\n\nDigite um valor para n: ");
	scanf("%d", &n);
	printf("\nO fatorial de %d e' %d", n, fat(n));
	return 0;
}