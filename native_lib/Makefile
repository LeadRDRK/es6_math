CC = gcc
CFLAGS = -O3 -Wall -Wextra -pedantic -fPIC -s
SRCS = src/es6_math.c
OBJS = $(SRCS:.c=.o)
TARGET = libes6_math.so

.PHONY: clean
    
all: $(TARGET)

$(TARGET): $(OBJS) 
	$(CC) $(CFLAGS) -lm -shared -o $(TARGET) $(OBJS) 

clean:
	$(RM) src/*.o *.so