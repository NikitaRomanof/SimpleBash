#ifndef S21_GREP_H
#define S21_GREP_H
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <regex.h>

struct specificators {
    int flag_e;
    int flag_i;
    int flag_v;
    int flag_c;
    int flag_l;
    int flag_n;
    int flag_h;
    int flag_s;
    int flag_f;
    int flag_o;
};


int instal_flags(int argc, char *argv[], struct specificators *spec_grep, char *search_string);
int copy_mas(char *search_string, char *str, int count_search_str);
int file_open(int argc, char *argv[], int error_point, struct specificators spec_grep, char *search_string);
void file_processing(FILE **f, struct specificators spec_grep,
                     char *search_string, char *file_name, int count_files);
void print_n(int line_count, struct specificators spec_grep);
int print_str(char *temp_str, char *file_name, struct specificators spec_grep,
              regmatch_t pm[], regex_t *preg);
void print_files_name(int count_files, struct specificators spec_grep, char *file_name);
int check_count_files(int argc, char *argv[], int error_point);
int flag_f_file(char *search_string, char *str_optarg, int *count_line);
void print_ve_flag(int count_files, int line_count, struct specificators spec_grep,
                    char *file_name, char *temp_str, int check_ve_flag);

#endif
