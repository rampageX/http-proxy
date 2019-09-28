debug = 0

OBJS = src/log.o \
       src/stream.o \
	   src/chnroute.o \
	   src/dnscache.o \
	   http-parser/http_parser.o \
	   rbtree/rbtree.c

ifneq ($(debug), 0)
    CFLAGS += -g -DDEBUG -D_DEBUG
    LDFLAGS += -g
endif

all: http-proxy

http-proxy: src/main.o $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

.PHONY: clean
clean:
	-rm -f src/*.o http-proxy


