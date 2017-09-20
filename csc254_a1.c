#include <stdio.h>
#include <stdlib.h>

#define MAX_K 254

static int buf[MAX_K] = { 0 };
static int buf_ind = 0;

#define PUSH_BUF(num) ( buf[buf_ind++] = (num) )
#define POP_BUF ( buf [buf_ind--] = 0 )

#define PRINT_BUF  \
{ \
         for(int i = 0; i < buf_ind; i++) { \
                printf("%d ", buf[i]); \
         } \
         printf("\n"); \
} \

void comb(int n, int k)
{
        if(k == 0)
        {
                PRINT_BUF;
                return;
        }


        // Enumerate n ... 1
        for (int i = n; i >= 1; i--)
        {
                PUSH_BUF(i);

                if (buf[buf_ind - 1] <= 0)
                {
                        // Do Nothing
                }
                else
                {
                        comb(i - 1, k-1);
                }

                POP_BUF;
        }

}

int main(int argc, char *argv[])
{
        int n, k;

        if(argc == 3)
        {
                n = atoi(argv[2]);
                k = atoi(argv[1]);

                comb(n, k);

                return EXIT_SUCCESS;
        }
        else
        {
                fprintf(stderr, "./prog <n> <k>\n");
                return EXIT_FAILURE;
        }
}
