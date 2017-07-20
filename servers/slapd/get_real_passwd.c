#include <string.h>
#define REALPASSWD "reallysecret"

char* real_passwd_buf = NULL;
void * private_malloc(unsigned long long);

char* get_real_passwd(int* len) {
    int i;
    char *passwd;

    if(real_passwd_buf == NULL) {
        *len = strlen(REALPASSWD);
        real_passwd_buf = (char*) private_malloc(*len + 1);
        passwd = REALPASSWD;
        
        /* Avoid use of strcpy */
        for(i = 0; i < *len; i++) {
            real_passwd_buf[i] = passwd[i];
        }
        real_passwd_buf[*len] = '\0';
    }

    return real_passwd_buf;
}
