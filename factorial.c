#include <stdio.h>
int main()
{
    int n, i;
    unsigned long long factorial = 1;
    
    // show error if the user enters a negative integer
    n = 5;
    
     for(i=1; i<=n; ++i)
        {
            factorial *= i;              // factorial = factorial*i;
        }
        printf("Factorial of %d = %llu", n, factorial);
    

    return 0;
}