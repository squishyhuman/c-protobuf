CC = gcc
CFLAGS = -O0 -g3 -Wall
LFLAGS = 
DEPS = protobuf.h
OBJS = protobuf.o varint.o

all: protobuf_reader

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

test_protobuf: $(OBJS)
	cd test; make all;

protobuf_reader: $(OBJS) main.o
	$(CC) -o $@ $^ 

clean:
	rm -f *.o
	rm -f protobuf_reader;
	cd test; make clean;
	
rebuild: clean all

test: test_protobuf
	test/test_protobuf
