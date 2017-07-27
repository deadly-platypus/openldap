#include <stddef.h>
#include <string.h>

/* Implements the super secure ROT 13 encryption scheme */
static char rot13(char input) {
    if(input >= 'a' && input <= 'z') {
        return 'a' + (input - 'a' + 13) % 26;
    } else if (input >= 'A' && input <= 'Z') {
        return 'A' + (input - 'A' + 13) % 26;
    } else {
        return input;
    }
}

static void enc_dec_passwd(char *passwd, char *dest, size_t len) {
    size_t i;
    for(i = 0; i < len; i++) {
        dest[i] = rot13(passwd[i]);
    }
}

void encrypt_passwd(char *passwd, char *dest, size_t length) {
    enc_dec_passwd(passwd, dest, length);
}

void decrypt_passwd(char *encpass, char *dest, size_t length) {
    enc_dec_passwd(encpass, dest, length);
}
