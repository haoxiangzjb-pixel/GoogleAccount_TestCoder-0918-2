# 定义编译目标
CC = gcc
CFLAGS = -Wall -g
TARGET = myprogram
SOURCES = main.c helper.c
OBJECTS = $(SOURCES:.c=.o)

# 默认目标
all: $(TARGET)

# 链接目标
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

# 编译源文件
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# 清理目标
clean:
	rm -f $(OBJECTS) $(TARGET)

# 伪目标
.PHONY: all clean