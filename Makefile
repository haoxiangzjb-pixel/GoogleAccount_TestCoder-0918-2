# 定义编译目标
TARGET = my_program

# 定义源文件
SOURCES = main.c helper.c

# 定义编译器
CC = gcc

# 定义编译选项
CFLAGS = -Wall -g

# 定义目标文件
OBJECTS = $(SOURCES:.c=.o)

# 默认目标
all: $(TARGET)

# 链接目标文件生成可执行文件
$(TARGET): $(OBJECTS)
	$(CC) -o $(TARGET) $(OBJECTS)

# 编译源文件生成目标文件
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# 清理生成的文件
clean:
	rm -f $(OBJECTS) $(TARGET)

# 伪目标
.PHONY: all clean