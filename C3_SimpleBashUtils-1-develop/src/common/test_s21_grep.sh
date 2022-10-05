#!/bin/bash
echo "GREP_TEST_1 no flags ud"
grep ud s21_grep.h > result.txt
./s21_grep ud s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_2 no flags a"
grep a s21_grep.h > result.txt
./s21_grep a s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_3 -e ag"
grep -e ag s21_grep.h > result.txt
./s21_grep -e ag s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_4 -e ag -e pr"
grep -e ag -e pr s21_grep.h > result.txt
./s21_grep -e ag -e pr s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_5 -i src_GREP_S21_grep_h_"
grep -i src_GREP_S21_grep_h_ s21_grep.h > result.txt
./s21_grep -i src_GREP_S21_grep_h_ s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_6 -v i"
grep -v i s21_grep.h > result.txt
./s21_grep -v i s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_7 -c ag"
grep -c ag s21_grep.h > result.txt
./s21_grep -c ag s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_8 -l pr"
grep -l ag s21_grep.h > result.txt
./s21_grep -l ag s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_9 -n ud"
grep -n ud s21_grep.h > result.txt
./s21_grep -n ud s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_10 -n -h ud"
grep -n -h ud s21_grep.h s21_grep.c > result.txt
./s21_grep -n -h ud s21_grep.h s21_grep.c > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_11 -h ud"
grep -h ud s21_grep.h s21_grep.c > result.txt
./s21_grep -h ud s21_grep.h s21_grep.c > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_12 -o ud"
grep -o ud s21_grep.h s21_grep.c > result.txt
./s21_grep -o ud s21_grep.h s21_grep.c > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_13 -o u"
grep -o u s21_grep.h s21_grep.c > result.txt
./s21_grep -o u s21_grep.h s21_grep.c > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_14 -o u d"
grep -o ud s21_grep.h s21_grep.c > result.txt
./s21_grep -o ud s21_grep.h s21_grep.c > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_15 -f ud"
cat > sample.txt << EOF
ud
EOF
grep -f sample.txt s21_grep.h > result.txt
./s21_grep -f sample.txt s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt sample.txt

echo "GREP_TEST_16 -i -e ag -e pr"
grep -i -e Ag -e pR s21_grep.h > result.txt
./s21_grep -i -e Ag -e pR s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_17 -n -i -e ag -e pr"
grep -n -i -e Ag -e pR s21_grep.h > result.txt
./s21_grep -n -i -e Ag -e pR s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_18 -n -i -e ag -e pr 2 files"
grep -n -i -e Ag -e pR s21_grep.h s21_grep.c > result.txt
./s21_grep -n -i -e Ag -e pR s21_grep.h s21_grep.c > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_19 -f ud"
cat > sample.txt << EOF
int flag_e;
int flag
EOF
grep -f sample.txt s21_grep.h > result.txt
./s21_grep -f sample.txt s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt sample.txt

echo "GREP_TEST_20 -vn -ea -eb 2 files"
grep -vn -ea -eb s21_grep.h ../common/search_grep.txt > result.txt
./s21_grep -vn -ea -eb s21_grep.h ../common/search_grep.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_21 -o -ea -eb"
grep -o -eud -est s21_grep.h > result.txt
./s21_grep -o -eud -est s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_22 -f -f"
grep -f../common/pat_grep_f.txt -f../common/pat2_grep_f.txt s21_grep.h > result.txt
./s21_grep -f../common/pat_grep_f.txt -f../common/pat2_grep_f.txt s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt


echo "GREP_TEST_23 -f -o"
grep -o  -f../common/pat2_grep_f.txt s21_grep.h> result.txt
./s21_grep -o  -f../common/pat2_grep_f.txt s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_24 -f -oi"
grep -oi  -f../common/pat2_grep_f.txt s21_grep.h> result.txt
./s21_grep -oi  -f../common/pat2_grep_f.txt s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "GREP_TEST_25 -oi -ea -eb"
grep -oi -euD -eSt s21_grep.h > result.txt
./s21_grep -oi -eUd -esT s21_grep.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "TEST_26 empty A"
grep A ../common/grep_test.txt > result.txt
./s21_grep A ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_27 empty A were"
grep were ../common/grep_test.txt > result.txt
./s21_grep were ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt

echo "TEST_27 -i 1_flag"
grep -i A ../common/grep_test.txt > result.txt
./s21_grep -i A ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_29 -i "
grep -i PRIG ../common/grep_quiz.txt > result.txt
./s21_grep -i PRIG  ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt

echo "TEST_30 -c 2_flag"
grep -c o ../common/grep_test.txt > result.txt
./s21_grep -c o ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt

echo "TEST_31 -v 3_flag"
grep -v t ../common/grep_test.txt > result.txt
./s21_grep -v t ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt

echo "TEST_32 -v -c "
grep -v -c 23 ../common/grep_quiz.txt > result.txt
./s21_grep -v -c 23 ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_33 -v -c"
grep -v -c hon ../common/grep_test.txt > result.txt
./s21_grep -v -c hon ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt

echo "TEST_34 -v -i"
grep -v -i 23 ../common/grep_quiz.txt > result.txt
./s21_grep -v -i 23 ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_35 -v -i"
grep -v -i hon ../common/grep_test.txt > result.txt
./s21_grep -v -i hon ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt

echo "TEST_36 -l4_flag"
grep -l pub ../common/grep_test.txt > result.txt
./s21_grep -l pub ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_37 -l 2_file"
grep -l 5 ../common/grep_test.txt ../common/grep_quiz.txt  > result.txt
./s21_grep -l 5 ../common/grep_test.txt ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt

echo "TEST_38  -n5_flag"
grep -n  with ../common/grep_test.txt > result.txt
./s21_grep -n  with ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_39 -n 2_file "
grep -n 6 ../common/grep_test.txt ../common/grep_quiz.txt  > result.txt
./s21_grep -n 6 ../common/grep_test.txt ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt

echo "TEST_40 -h6_flag"
grep -h books ../common/grep_test.txt > result.txt
./s21_grep -h books ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt

echo "TEST_41 -h 2_file "
grep -h 31 ../common/grep_test.txt ../common/grep_quiz.txt > result.txt
./s21_grep -h 31 ../common/grep_test.txt ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt

echo "TEST_42 -s7_flag"
grep -s a ../common/grep_test.txt ../common/grep_qui.txt > result.txt
./s21_grep -s a ../common/grep_test.txt ../common/grep_qui.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_43 flag not -s"
grep a -i ../common/grep_test.txt > result.txt
./s21_grep a -i ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt

echo "TEST_44 -o8_flag"
grep -o 12 ../common/grep_test.txt ../common/grep_quiz.txt > result.txt
./s21_grep -o 12 ../common/grep_test.txt ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_45 -o"
grep -o 0 ../common/grep_test.txt ../common/grep_quiz.txt > result.txt
./s21_grep -o 0 ../common/grep_test.txt ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_46 -o"
grep -i a ../common/grep_test.txt > result.txt
./s21_grep -i a ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_47 -o -n"
grep -o -n 12 ../common/grep_test.txt ../common/grep_quiz.txt > result.txt
./s21_grep -o -n 12 ../common/grep_test.txt ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_48 -o -i"
grep -o -i with ../common/grep_test.txt ../common/grep_quiz.txt > result.txt
./s21_grep -o -i with ../common/grep_test.txt ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_49 -o -v"
grep -o -v a ../common/grep_test.txt > result.txt
./s21_grep -o -v a ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_50 -o -v -i -n"
grep -o -v -i -n a ../common/grep_test.txt > result.txt
./s21_grep -o -v -i -n a ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_51 -o -v -i -n 2_file"
grep -o -v -i -n a ../common/grep_test.txt ../common/grep_quiz.txt > result.txt
./s21_grep -o -v -i -n a ../common/grep_test.txt ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_52 -v -n -o"
grep -v -n -o a ../common/grep_test.txt > result.txt
./s21_grep -v -n -o a ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_53 -e9_flag"
grep -e a  ../common/grep_test.txt > result.txt
./s21_grep -e a  ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_54 -e -e"
grep -e 1 -e grat ../common/grep_test.txt > result.txt
./s21_grep -e 1 -e grat ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_55 -v -n -o -e"
grep -v -n -o -e a ../common/grep_test.txt > result.txt
./s21_grep -v -n -o -e a ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_56 -n  -e -e"
grep -n -e 3 -e 2 ../common/grep_test.txt > result.txt
./s21_grep -n -e 3 -e 2 ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_57 -v -n -o -e -e"
grep -v -n -o -e a -e 2 ../common/grep_test.txt > result.txt
./s21_grep -v -n -o -e a -e 2 ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_58 -n -l"
grep -n -l 2 ../common/grep_test.txt > result.txt
./s21_grep -n -l 2 ../common/grep_test.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_59 -n -o -e -e"
grep -n -e 2 -e a ../common/grep_test.txt ../common/grep_quiz.txt > result.txt
./s21_grep -n -e 2 -e a ../common/grep_test.txt ../common/grep_quiz.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt
echo "TEST_60 -f10_flag"
grep -f ../common/1.txt ../common/grep_test.txt  > result.txt
./s21_grep -f ../common/1.txt ../common/grep_test.txt  > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "Равны\n" 
else
 echo "Нeравны\n"
fi
rm result.txt s21_result.txt