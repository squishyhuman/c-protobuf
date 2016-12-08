CC = gcc
CFLAGS = -O0 -g3 -Wall
LFLAGS = 
DEPS = protobuf.h
OBJS = protobuf.o varint.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

test_protobuf: $(OBJS)
	$(CC) -o $@ $^ $(LFLAGS)

all: $(OBJS)
	cd test; make all;
	
clean:
	rm -f *.o
	cd test; make clean;
	
rebuild: clean all