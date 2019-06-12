CC = gcc
CFLAGS = -Ofast -ffreestanding -fopenmp -DSTREAM_ARRAY_SIZE=100000000 -DNTIMES=10 -DOFFSET=0

all: stream.exe

stream.exe: stream.c
	$(CC) $(CFLAGS) stream.c -o stream
	$(CC) $(CFLAGS) -DTUNED stream.c -o stream.tuned

clean:
	rm -f stream_c.exe *.o

# an example of a more complex build line for the Intel icc compiler
stream.icc: stream.c
	icc -O3 -xCORE-AVX2 -ffreestanding -qopenmp -DSTREAM_ARRAY_SIZE=80000000 -DNTIMES=20 stream.c -o stream.omp.AVX2.80M.20x.icc
