#include "mempool.h"
#include <stdio.h>
#include <string.h>

int main(void) {
    mempool_t *p = mempool_create();
    if (!p) {
        fprintf(stderr, "mempool_create failed\n");
        return 1;
    }
    void *a = mp_alloc(p, 42);
    if (!a) {
        fprintf(stderr, "mp_alloc failed\n");
        return 1;
    }
    memset(a, 0xAB, 42);
    mp_free(p, a);
    mempool_destroy(p);
    printf("test_package OK\n");
    return 0;
}
