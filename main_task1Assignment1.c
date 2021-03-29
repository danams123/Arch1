#include <stdio.h>
#define MAX_LEN 100 /* maximal input string size */

extern int assFunc(int);
// void assFunc(int num)
// {
//     num = num * 4;
//     if (c_checkValidity(num) == 0)
//         num = num * 2;
//     printf("%d \n", num);
// }

int main(int argc, char **argv)
{

    char str_buf[MAX_LEN];
    int input;
    fgets(str_buf, MAX_LEN, stdin);
    sscanf(str_buf, "%d", &input);
    assFunc(input);
    return 0;
}

int c_checkValidity(int x)
{
    return (x + 1) % 2;
}
