CC = gcc
CFLAGS = -g -Ofast -march=native -ffreestanding -fopenmp -DSTREAM_ARRAY_SIZE=100000000 -DNTIMES=20 -DOFFSET=0

all: stream stream.nt stream.hugepage

stream: stream.c
	$(CC) $(CFLAGS) stream.c -o stream

stream.nt: stream.c
	$(CC) $(CFLAGS) -DTUNED stream.c -o stream.nt

stream.hugepage: stream.c
	$(CC) $(CFLAGS) -DTUNED -DHUGEPAGE stream.c -o stream.hugepage

clean:
	rm -f stream stream.nt stream.hugepage *.o

# an example of a more complex build line for the Intel icc compiler
stream.icc: stream.c
	icc -O3 -xCORE-AVX2 -ffreestanding -qopenmp -DSTREAM_ARRAY_SIZE=80000000 -DNTIMES=20 stream.c -o stream.omp.AVX2.80M.20x.icc
