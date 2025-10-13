# 定义编译目标
build:
	gcc -o my_program main.c

# 定义清理目标
clean:
	rm -f my_program

# 定义伪目标
.PHONY: build clean