#include <stdio.h>
#include <fstream>
#include <iostream>


int func(int a[], int size){
	int i;
	int cont = 1;
	for (i=0; i < size; i = i + 2){
		for (int j=0; j< a[i]; j++){
      			printf(" %d ", a[i+1]);
		}
	}
}

int main()
{
	int v[15] = {3,1,1,4,2,1,2,4,1,25,4,67,2,2};
	func(v,15);
}

