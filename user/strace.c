#include "kernel/param.h"
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[])
{
    char *argList[MAXARG];
    int b = atoi(argv[1]);
    int i;
    if (argc < 3)
    {
        fprintf(2, "Usage: %s mask command\n", argv[0]);
        exit(1);
    }
    else if (argv[1][0] < '0' || argv[1][0] > '9')
    {
        fprintf(2, "Usage: %s mask command\n", argv[0]);
        exit(1);
    }
    // error handling
    if (trace(b) < 0)
    {
        fprintf(2, "%s: trace failed\n", argv[0]);
        exit(1);
    }
    for (i = 2; i < argc; i++)
    {
        if(i < MAXARG)
            argList[i - 2] = argv[i];
    }

    exec(argList[0], argList);

    exit(0);
}