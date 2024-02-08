CROSS_COMPILE = 
CROSS_COMPILE = x86_64-linux-gnu-

CC=$(CROSS_COMPILE)gcc
TARGET := writer
SRCS := writer.c
OBJS := writer.o

all: $(TARGET)

writer: $(OBJS)

clean:
	$(RM) $(TARGET) 
    