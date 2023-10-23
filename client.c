#include "minitalk.h"

void	send_msg(int pid, char *str)
{
	int		i;
	int		base;
	char	letra;

	i = 0;
	while (str[i])
	{
		base = 128;
		letra = str[i];
		while (base > 0)
		{
			if (letra >= base)
			{
				kill(pid, SIGUSR1);
				letra = letra - base;
			}
			else
				kill(pid, SIGUSR2);
			base = base / 2;
			usleep(100);
		}
		i++;
	}
}

int main (int argc, char **argv)
{
    pid_t pid;
    char    *str;

    if (argc != 3)
    {
        ft_putstr_fd("The client need 3 arguments.", 1);
        return (-1);
    }
    str = (argv[2]);
    pid = ft_atoi(argv[1]);
    if (pid <= 0)
    {
        ft_putstr_fd("Invalid PID", 2);
        exit(EXIT_FAILURE);
    }
    send_msg(pid, argv[2]);
    return (0);
}