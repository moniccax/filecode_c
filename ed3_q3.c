#include <stdio.h>
#include <fstream>
#include <iostream>


int func(int a[], int size){
	int i;
	int cont = 1;
	for (i=0; i < size; i++){
		if (a[i]==a[i+1]){
			cont++;
		}
		if(a[i]!=a[i+1]){
      			printf(" : %d ", cont);
      			printf(" %d ", a[i]);
			cont = 1;
		}
	}

}

int main()
{
	int v[15] = {1,1,1,4,1,1,4,4,25,67,67,67,67,2,2};
	func(v,15);
}

