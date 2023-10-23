#include "minitalk.h"

void    txt_converter(char *str)
{
    int     i;
    int     base;
    int     res;
    int     iter;
    char    bit;

    i = 7;
    while (str[i])
    {
        base = 1;
        iter = i;
        res = 0;
        while (base <= 128)
        {
            bit = str[iter];
            if (bit == '1')
                res = res + base;
            base = base * 2;
            iter--;
        }
        write (1, &res, 1);
        i = i + 8;
    }
}

void    bin(int b)
{
    static int     i = 0;;
    static char    c[8];

    if (b == SIGUSR1)
        c[i] = '1';
    else if (b == SIGUSR2)
        c[i] = '0';
    i++;
    if (i == 8)
    {
        i = 0;
        txt_converter(c);
    }
}

int main(void)
{
    pid_t   pid;

    pid = getpid();
    ft_putstr_fd("PID: ", 1);
    ft_putnbr_fd(pid, 1);
    write (1, "\n", 1);
    signal(SIGUSR1, bin);
    signal(SIGUSR2, bin);
    while (1)
    {
        sleep(1);
    }
    return (0);
}