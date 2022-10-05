CC=gcc
LDFLAGS= -Wall -Wextra -Werror -std=c11
OS := $(shell uname -s)

ifeq ($(OS), Darwin)
	CC += -D OS_MAC
else
	CC += -D OS_LINUX
endif

default: all

all: s21_cat

s21_cat:
ifeq ($(OS), Darwin)
	$(CC) s21_cat.c -o s21_cat
else
	$(CC) -D_GNU_SOURCE -lm s21_cat.c -o s21_cat
endif


clean:
	rm -f s21_cat *.cfg

check_cat: s21_cat
	cppcheck --enable=all --suppress=missingIncludeSystem *.c *.h
	cp ../../materials/linters/CPPLINT.cfg CPPLINT.cfg
	python3 ../../materials/linters/cpplint.py --extension=c *.c
ifeq ($(OS), Darwin)
	CK_FORK=no leaks --atExit -- ./s21_cat
else
	valgrind --leak-check=full --show-leak-kinds=all ./s21_cat
endif

check: check_cat

test_cat:
	sh ../common/test_s21_cat.sh

test: test_cat