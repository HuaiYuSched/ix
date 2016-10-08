#include <stdio.h>

int main(){
	int cs,ds;
	asm("\t movl %%cs, %0": "=r"(cs));
	asm("\t movl %%ss, %0": "=r"(ds));
	printf("hello world, cs value is: %lx\n",cs);
	printf("hello world, ds value is: %lx\n",ds);

	return 0;
}
