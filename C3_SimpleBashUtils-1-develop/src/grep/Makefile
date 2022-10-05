CC=gcc
LDFLAGS= -Wall -Wextra -Werror -std=c11
OS := $(shell uname -s)
ifeq ($(OS), Darwin)
	CC += -D OS_MAC
else
	CC += -D OS_LINUX
endif

default: all

all: s21_grep


s21_grep:
ifeq ($(OS), Darwin)
	$(CC) s21_grep.c -o s21_grep
else
	$(CC) -D_GNU_SOURCE s21_grep.c -o s21_grep
endif

clean:
	rm -f s21_grep *.cfg


check_grep: s21_grep
	cppcheck --enable=all --suppress=missingIncludeSystem *.c *.h
	cp ../../materials/linters/CPPLINT.cfg CPPLINT.cfg
	python3 ../../materials/linters/cpplint.py --extension=c *.c
	
ifeq ($(OS), Darwin)
	CK_FORK=no leaks --atExit -- ./s21_grep
else
	valgrind --leak-check=full --show-leak-kinds=all ./s21_grep
endif

check: check_grep

test_grep:
	sh ../common/test_s21_grep.sh

test: test_grep
