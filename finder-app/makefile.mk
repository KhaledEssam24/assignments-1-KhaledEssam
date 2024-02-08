CC = gcc
CFLAGS = -I.
TARGET = writer
SRCS = writer.c
OBJS = writer.o

# Build rule for native platform
$(TARGET): $(OBJS)
    $(CC) $(CFLAGS) -o $@ $^

# Build rule for cross-compilation
aarch64-none-linux-gnu-%: CROSS_COMPILE := aarch64-none-linux-gnu-
aarch64-none-linux-gnu-%: $(OBJS)
    $(CROSS_COMPILE)$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
    $(CC) $(CFLAGS) -c -o $@ $<

.PHONY: clean

clean:
    rm -f $(TARGET) $(OBJS)
