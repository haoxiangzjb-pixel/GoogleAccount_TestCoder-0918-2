# 定义编译目标
.PHONY: all clean

# 默认目标
all: my_program

# 编译规则 (假设源文件是 my_program.c)
my_program: my_program.c
	gcc -o my_program my_program.c

# 清理规则
clean:
	rm -f my_program

# 重新编译
rebuild: clean all