#ifndef S21_CAT_H
#define S21_CAT_H
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>


struct specificators {
    int flag_b;
    int flag_e;
    int flag_n;
    int flag_s;
    int flag_t;
    int flag_v;
    int flag_E;
    int flag_T;
};


int set_flags(int argc, char *argv[], struct specificators* specificator);
int read_files(int argc, char *argv[], int error_point, struct specificators specificator);
int print_files(char *file_name, struct specificators specificator);
void processing_n(struct specificators specificator, int *flag_start, char n_char);
void processing_s(struct specificators specificator, int *flag_start,
char n_char, char *f_char, FILE **f, int flag_s_first);
void processing_b(struct specificators specificator, int *flag_start, char n_char, char f_char);
void processing_E_ev(struct specificators specificator, char *f_char);
void processing_T_tv(struct specificators specificator, char *f_char);
void processing_v(struct specificators specificator, char *f_char);

#endif
