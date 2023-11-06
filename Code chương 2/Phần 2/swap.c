#include <stdio.h>
void swap(int a, int b){
int t = a;
a = b;
b = t;
printf("Inside swap: a = %d, b = %d\n", a, b); 
return;
}
int main(void) {
int a = 21;
int b = 17;
printf("Before swap: a = %d, b = %d\n", a, b); 
swap(a, b);
printf("Outside swap: a = %d, b = %d\n", a, b);
return 0;
}


algoFunc(int x)
{
double sqrtX;
int i;
if ( x == 2 )
return 1 ;
if ( x <= 1 || (x & 1) == 0 )
return 0;
sqrtX = sqrt((double)x)
for ( i = 3; sqrtX>= (double)i; i += 2 ) {
if ( x % i == 0 )
return 0;
}
return 1 ;
}
