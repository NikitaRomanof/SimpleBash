#include "s21_cat.h"

int main(int argc, char *argv[]) {
  int error_set = 0;
  int error_read = 0;
  struct specificators specificator = {0};
  error_set = set_flags(argc, argv, &specificator);
  error_read = read_files(argc, argv, error_set, specificator);
  return error_set + error_read;
}

int set_flags(int argc, char *argv[], struct specificators* specificator) {
  //  устанавливаем флаги
  int error_point = 0;
  if (argc > 1) {
    const char* short_flags = "benstvET";
    const struct option long_flags[] = {
      {"number-nonblank", no_argument, NULL, 'b'},
      {"number", no_argument, NULL, 'n'},
      {"squeeze-blank", no_argument, NULL, 's'},
      {NULL, 0, NULL, 0}
    };
    int rez;
    int index;
    opterr = 0;
    while ((rez = getopt_long(argc, argv, short_flags, long_flags, &index)) != -1) {
      if (rez == 'b') specificator->flag_b = 1;
      if (rez == 'e') specificator->flag_e = 1;
      if (rez == 'E') specificator->flag_E = 1;
      if (rez == 'n') specificator->flag_n = 1;
      if (rez == 's') specificator->flag_s = 1;
      if (rez == 't') specificator->flag_t = 1;
      if (rez == 'T') specificator->flag_T = 1;
      if (rez == 'v') specificator->flag_v = 1;
      if (rez == '?') error_point = 1;
    }
    specificator->flag_n = (specificator->flag_b == 1) ? 0 : specificator->flag_n;
    specificator->flag_v = (specificator->flag_e == 1) ? 1 : specificator->flag_v;
    specificator->flag_v = (specificator->flag_t == 1) ? 1 : specificator->flag_v;
  } else {
      error_point = 1;
  }
  return error_point;
}

int read_files(int argc, char *argv[], int error_point, struct specificators specificator) {
  //  считываем аргументы не явлюящиеся флагами
    int error = 0;
    for (int count_args = 1; count_args < argc; count_args++) {
      if (*argv[count_args] != '-' && argc > 0 && error_point == 0) {
        error = print_files(argv[count_args], specificator);
      }
    }
    return error;
}

int print_files(char *file_name, struct specificators specificator) {
  int error = 0;
  //  открываем файл на чтение и выводим текст из файла в соответствии с флагами
  FILE *f = fopen(file_name, "r");
  int flag_start = 0;
  if (f != NULL) {
    char n_char;
    char f_char;
    if ((n_char = getc(f)) != EOF) {
      if (specificator.flag_n == 1 || (specificator.flag_b == 1 && n_char != '\n')) {
        flag_start++;
        printf("%6d\t", flag_start);
      }
        processing_T_tv(specificator, &n_char);
        processing_E_ev(specificator, &n_char);
        for (int flag_s_first = 0; (f_char = getc(f)) != EOF; ) {
        processing_s(specificator, &flag_start, n_char, &f_char, &f, flag_s_first);
        flag_s_first = 1;
        printf("%c", n_char);
        processing_n(specificator, &flag_start, n_char);
        processing_b(specificator, &flag_start, n_char, f_char);
        processing_T_tv(specificator, &f_char);
        if (specificator.flag_e == 0 && specificator.flag_t == 0) {
          processing_v(specificator, &f_char);
        }
        processing_E_ev(specificator, &f_char);
        if (f_char != -1) {
          n_char = f_char;
        }
      }
       printf("%c", n_char);
    }
    flag_start = 0;
    fclose(f);
  } else {
      error = 1;
  }
        return error;
}

void processing_s(struct specificators specificator, int *flag_start, char n_char,
                   char *f_char, FILE **f, int flag_s_first) {
  //  обработка флага s
    if (specificator.flag_s == 1 && n_char == '\n' && *f_char == '\n') {
      int z;
        while (*f_char == '\n') {
            z = (*f_char = getc(*f));
        }
        if (z != -1) {
          if (flag_s_first > 0) {
            printf("%c", n_char);
          }
            processing_n(specificator, flag_start, n_char);
        }
        if (specificator.flag_e == 1) {
            printf("$");
        }
    }
}

void processing_n(struct specificators specificator, int *flag_start, char n_char) {
  //  обработка флага n
    if (specificator.flag_n == 1 && n_char == '\n') {
        *flag_start +=1;
        printf("%6d\t", *flag_start);
    }
}

void processing_b(struct specificators specificator, int *flag_start, char n_char, char f_char) {
  //  обработка флага b
    if (specificator.flag_b == 1 && n_char == '\n' && f_char != '\n' && f_char != EOF) {
        *flag_start +=1;
        printf("%6d\t", *flag_start);
    }
}

void processing_E_ev(struct specificators specificator, char *f_char) {
  //  обработка флагов E, ev
    if (specificator.flag_e == 1 && specificator.flag_v == 1) {
      processing_v(specificator, f_char);
      if (*f_char == 10) {
        printf("$");
      }
    } else if (specificator.flag_E == 1 && *f_char == 10) {
      printf("$");
    }
}

void processing_T_tv(struct specificators specificator, char *f_char) {
  //  обработка флагов T, tv
    if (specificator.flag_t == 1 && specificator.flag_v == 1) {
      processing_v(specificator, f_char);
      if (*f_char == 9) {
        printf("^");
        *f_char = 'I';
      }
    } else if (specificator.flag_T == 1 && *f_char == 9) {
      printf("^");
      *f_char = 'I';
    }
}

void processing_v(struct specificators specificator, char *f_char) {
  //  обработка флагов T, tv
    if (specificator.flag_v == 1) {
      if (*f_char < 0) {
        printf("M-");
        *f_char -= 128;
      }
      if (*f_char >= 0 && * f_char < 32 && *f_char != 9 && *f_char != 10) {
        printf("^");
        *f_char += 64;
      }
      if (*f_char == 127) {
        printf("^?");
      }
    }
}
