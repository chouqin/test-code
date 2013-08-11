#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/*在函数体里面新建字符串*/
char * get_reverse_string(const char *p)
{
    int len=strlen(p);

    char *new_string = malloc(len+1);
    if (new_string == NULL) {
        return NULL;
    }
    int i = 0;
    for (; i < len; ++i) {
        if((p[i] == '\\') &&
                (i != (len-1))) {
            new_string[len-1-i] = p[i+1];
            ++i;
            new_string[len-1-i] = p[i-1];
        } else {
            new_string[len-1-i] = p[i];
        }
    }
    new_string[len] = '\0';
    return new_string;
}


/*在函数体里面不新建字符串*/
/*返回result的strlen长度*/
int reverse_to_string(const char *p, char * result)
{

    int len=strlen(p);
    int i = 0;
    for (; i < len; ++i) {
        if((p[i] == '\\') &&
                (i != (len-1))) {
            result[len-1-i] = p[i+1];
            ++i;
            result[len-1-i] = p[i-1];
        } else {
            result[len-1-i] = p[i];
        }
    }
    result[len] = '\0';

    return len;
}
