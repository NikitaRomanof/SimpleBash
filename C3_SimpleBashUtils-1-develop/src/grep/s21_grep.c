#include "s21_grep.h"

int main(int argc, char *argv[]) {
  char search_string[9000] = {0};
  int err_flag = 0, err_file = 0;
  struct specificators spec_grep = {0};
  err_flag = instal_flags(argc, argv, &spec_grep, search_string);
  err_file = file_open(argc, argv, err_flag, spec_grep, search_string);
  return err_flag + err_file;
}

int instal_flags(int argc, char *argv[], struct specificators *spec_grep, char *search_string) {
  //  устанавливает флаги в структуру, обрабатывает аргументы флагов "е", "f" и аргумент поисковой строки
  int error = 0;
  if (argc > 1) {
    const char* flags = "e:ivclnhsf:o";
    const struct option null_flags[] = {
      {NULL, 0, NULL, 0} };
    int rez, index, count_search_str = 0, count_flaf_e = 0, count_line = 0;
    opterr = 0;
    while ((rez = getopt_long(argc, argv, flags, null_flags, &index)) != -1) {
      if (rez == 'e') {
        spec_grep->flag_e = 1;
        if (spec_grep->flag_f == 0) {
          count_flaf_e = copy_mas(search_string, optarg, count_flaf_e);
        } else {
          spec_grep->flag_e = 0;
        }
        *optarg = '\0';  //  зануляем аргумент флага e
        count_search_str = 1;
      }
      if (rez == 'i') {spec_grep->flag_i = 1;}
      if (rez == 'v') {spec_grep->flag_v = 1;}
      if (rez == 'c') {spec_grep->flag_c = 1;}
      if (rez == 'l') {spec_grep->flag_l = 1;}
      if (rez == 'n') {spec_grep->flag_n = 1;}
      if (rez == 'h') {spec_grep->flag_h = 1;}
      if (rez == 's') {spec_grep->flag_s = 1;}
      if (rez =='f') {
        spec_grep->flag_f = 1;
        if (spec_grep->flag_e == 0) {
          flag_f_file(search_string, optarg, &count_line);
          count_search_str = 1;
        } else {
          spec_grep->flag_f = 0;
        }
        *optarg = '\0';  //  зануляем аргумент флага f
      }
      if (rez == 'o') {spec_grep->flag_o = 1;}
      if (rez == '?') {error = 1;}
    }
    if (count_search_str == 0) {  //  если нет флагов f и e, берем аргумент без "-" из аргв в серч стринг
      for (int count_args = 1; count_args < argc; count_args++) {
        if (*argv[count_args] != '-' && error == 0 && count_search_str == 0 && *argv[count_args] != '\0') {
          copy_mas(search_string, argv[count_args], count_search_str);
          count_search_str = 1;
        }
      }
    }
  } else {
    error = 1;
  }
  return error;
}

int flag_f_file(char *search_string, char *str_optarg, int *count_line) {
  //  для флага "-f" открываем файл из аргумента флага, считываем данные в поисковую строку
  int error = 0;
    FILE *f = fopen(str_optarg, "r");
    if (f != NULL) {
    char ch;
    int i = 0;
    while ((ch = getc(f)) != EOF) {
      *(search_string + i + *count_line) = ch;
      i++;
    }
    *count_line = i;
    *(search_string + *count_line) = '\n';
    *count_line += 1;
    fclose(f);
  } else {
    error = 1;
  }
  return error;
}

int file_open(int argc, char *argv[], int error_point, struct specificators spec_grep, char *search_string) {
  // открываем файл с данными для поиска соответствий
  int error = 0;
  int count_files = check_count_files(argc, argv, error_point);
  for (int count = 1; count < argc; count++) {
    if (*argv[count] != '-' && error_point == 0 && *argv[count] != '\0') {
      FILE *f = fopen(argv[count], "r");
      if (f != NULL) {
        file_processing(&f, spec_grep, search_string, argv[count], count_files);
        fclose(f);
      } else {
        error = 1;
        if (spec_grep.flag_s == 0) printf("grep: %s: No such file or directory\n", argv[count]);
      }
    }
  }
  return error;
}

int check_count_files(int argc, char *argv[], int error_point) {
  //  подсчёт колличества имён файлоф до их непосредственного открытия
  int count_files = 0;
  for (int count = 1; count < argc; count++) {
    if (*argv[count] != '-' && error_point == 0 && *argv[count] != '\0') {
      count_files += 1;
    }
  }
  return count_files;
}

void file_processing(FILE **f, struct specificators spec_grep, char *search_string,
                     char *file_name, int count_files) {
  //  основная функция.
  //  построчно берется информация из файла и сравнивается с помощью regex с "куском" поисковой строки
  char *temp_str = NULL;
  size_t len = 0;
  int line_count = 0, flag_l = 0, succes_read_line = 0;
  while ((getline(&temp_str, &len, *f)) != EOF && flag_l == 0) {
    char *pattern = NULL, copy_search_string[9000] = {0};
    int check_flag = 0, check_ve_flag = 0;
    line_count += 1;
    char *last;
    for (size_t i = 0; i < strlen(search_string); i++) {
      *(copy_search_string + i) = *(search_string + i);
    }
    if (spec_grep.flag_f == 1) {
      pattern = strtok_r(copy_search_string, "\n", &last);
    } else {
      pattern = strtok_r(copy_search_string, " ", &last);
    }
  //  куски копии поисковой строки бьем на паттерны (в зависимости от наличия флага f)
    while (pattern != NULL && check_flag == 0) {
      regex_t preg;
      int regex_flag = 0, compare = 0, regex_nmatch = 0;
      if (spec_grep.flag_i == 1) {regex_flag = REG_ICASE;}
      if (spec_grep.flag_v == 1) {compare = REG_NOMATCH; spec_grep.flag_o = 0;}
      if (spec_grep.flag_o == 1) {regex_nmatch = 1;}
        regcomp(&preg, pattern, regex_flag);
      regmatch_t pm[1];
      int regex_return = regexec(&preg, temp_str, regex_nmatch, pm, 0);
      if (regex_return == compare) {
        check_flag = 1;
        //  ВАЖНО! если по первому куску поисковой строки что-то нашлось в строке, второй кусок не проверяем
        //  в общем случае, но если есть флаги -ev || -fv || -o проверяем все куски токена
        if ((spec_grep.flag_o == 1) || (spec_grep.flag_e == 1 &&  spec_grep.flag_v == 1) ||
            (spec_grep.flag_f == 1 &&  spec_grep.flag_v == 1)) {
          check_flag = 0;
        }
        succes_read_line += 1;
        print_files_name(count_files, spec_grep, file_name);
        print_n(line_count, spec_grep);
        flag_l = print_str(temp_str, file_name, spec_grep, pm, &preg);
  //  ВАЖНО если при флаге "l" нашлось совпадение дальше файл не проверяем
      } else {
        check_ve_flag = 1;
      }
      regfree(&preg);
      if (spec_grep.flag_f == 1) {
        pattern = strtok_r(NULL, "\n", &last);
      } else {
        pattern = strtok_r(NULL, " ", &last);
      }
    }
      print_ve_flag(count_files, line_count, spec_grep, file_name, temp_str, check_ve_flag);
      pattern = NULL;
      last = NULL;
      memset(copy_search_string, 0, 9000);
  }
  free(temp_str);
  temp_str = NULL;
  if (spec_grep.flag_c == 1 && (count_files > 1 && spec_grep.flag_l == 0)) {
    printf("%s:%d\n", file_name, succes_read_line);
  } else if (spec_grep.flag_c == 1 && spec_grep.flag_l == 1 && count_files > 1) {
     printf("%s:%d\n", file_name, succes_read_line);
     printf("%s\n", file_name);
  } else if (spec_grep.flag_c == 1 && spec_grep.flag_l == 1 && count_files < 2) {
     printf("%d\n", succes_read_line);
     printf("%s\n", file_name);
  } else if (spec_grep.flag_c == 1) {
    printf("%d\n", succes_read_line);
    }
}

void print_ve_flag(int count_files, int line_count, struct specificators spec_grep,
                    char *file_name, char *temp_str, int check_ve_flag) {
  if ((spec_grep.flag_e == 1 || spec_grep.flag_f == 1) && spec_grep.flag_v == 1 && check_ve_flag == 0) {
      if (spec_grep.flag_h != 1 && count_files > 1 && spec_grep.flag_c != 1 && spec_grep.flag_l != 1) {
        printf("%s:", file_name);
      }
      if (spec_grep.flag_n == 1 && spec_grep.flag_c != 1 && spec_grep.flag_l != 1) {
         printf("%d:", line_count);
       }
       printf("%s", temp_str);
  }
}

int print_str(char *temp_str, char *file_name, struct specificators spec_grep,
              regmatch_t pm[], regex_t *preg) {
  //  основная функция печати найденной строки
  int flag_l = 0;
  if (spec_grep.flag_l == 1) {
    flag_l = 1;
    if (spec_grep.flag_c == 0) printf("%s\n", file_name);
  } else if (spec_grep.flag_c == 1) {
  //  что бы не ломать логику ничего не происходит, сделано отдельно после цикла
  } else if ((spec_grep.flag_e == 1 || spec_grep.flag_f == 1) && spec_grep.flag_v == 1) {
  } else if (spec_grep.flag_o == 1) {
  //  обработка флага "o" при помощи стандартной структуры регекса "regmatch_t pm[]"
    int i;
    int regerror = regexec(preg, temp_str, 1, pm, 0);
    while (regerror == 0) {
      for (i = pm[0].rm_so; i < pm[0].rm_eo; ++i) {
        printf("%c", temp_str[i]);
      }
      temp_str += pm[0].rm_eo;
      printf("\n");
      regerror = regexec(preg, temp_str, 1, pm, 0);
    }
  } else {
    printf("%s", temp_str);
    int l = strlen(temp_str) - 1;
    if (*(temp_str + l) != '\n') {  //  обрабатываем переносы строки если их нет в файле
      printf("\n");
    }
  }
  return flag_l;
}

void print_files_name(int count_files, struct specificators spec_grep, char *file_name) {
  //  печатает имя файла в стандартной ситуации
  if (spec_grep.flag_h != 1 && count_files > 1 && spec_grep.flag_c != 1 && spec_grep.flag_l != 1) {
    if (((spec_grep.flag_e == 1 || spec_grep.flag_f == 1) && spec_grep.flag_v == 1)) {
    } else {
       printf("%s:", file_name);
    }
  }
}

void print_n(int line_count, struct specificators spec_grep) {  //  обабатываетфлаг "n"
  if (spec_grep.flag_n == 1 && spec_grep.flag_c != 1 && spec_grep.flag_l != 1) {
    if (((spec_grep.flag_e == 1 || spec_grep.flag_f == 1) && spec_grep.flag_v == 1)) {
    } else {
       printf("%d:", line_count);
    }
  }
}

int copy_mas(char *search_string, char *str, int count_search_str) {
  //  копирует из argv в поисковую строку, ставим в ручную пробел в строке для дальнейшей разбивки
  int len = strlen(str);
  for (int i = 0; i < len; i++) {
    *(search_string + i + count_search_str) = *(str + i);
  }
  *str = '\0';
  *(search_string + len + count_search_str) = ' ';
  return len + count_search_str + 1;
}

