#!/bin/bash
echo "CAT_TEST_1 no flags"
cat s21_cat.h > result.txt
./s21_cat s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_2 --number-nonblank"
cat -b s21_cat.h > result.txt
./s21_cat --number-nonblank s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n" 
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_3 -b"
cat -b s21_cat.h > result.txt
./s21_cat -b s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n" 
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_4 -n"
cat -n s21_cat.h > result.txt
./s21_cat -n s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_5 --number "
cat -n s21_cat.h > result.txt
./s21_cat --number s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_6 -s"
cat -s s21_cat.h > result.txt
./s21_cat -s s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_7 --squeeze-blank"
cat -s s21_cat.h > result.txt
./s21_cat --squeeze-blank s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_8 -e"
cat -ev s21_cat.h > result.txt
./s21_cat -ev s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_9 -t "
cat -t s21_cat.h > result.txt
./s21_cat -t s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_10 -E "
cat -ve s21_cat.h > result.txt
./s21_cat -E s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_11 -T "
cat -vt s21_cat.h > result.txt
./s21_cat -T s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_12 -bset"
cat -bset s21_cat.h > result.txt
./s21_cat -bset s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_13 -nset"
cat -nset s21_cat.h > result.txt
./s21_cat -nset s21_cat.h > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_14 -s enter"
cat > sample.txt << EOF



1234




EOF
cat -s sample.txt > result.txt
./s21_cat -s sample.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt sample.txt



echo "CAT_TEST_15 -t tab"
cat > sample.txt << EOF
            
            1234


EOF
cat -t sample.txt > result.txt
./s21_cat -t sample.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt sample.txt


echo "CAT_TEST_16 -etn"
cat > sample.txt << EOF
            
            1234


EOF
cat -etn sample.txt > result.txt
./s21_cat -etn sample.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt sample.txt

echo "CAT_TEST_17 -etb"
cat > sample.txt << EOF
            
            1234


EOF
cat -etb sample.txt > result.txt
./s21_cat -etb sample.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt sample.txt

echo "CAT_TEST_18 -et"
cat > sample.txt << EOF
            
            1234


EOF
cat -et sample.txt > result.txt
./s21_cat -et sample.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt sample.txt

echo "CAT_TEST_19 -e"
cat > sample.txt << EOF
            
            1234


EOF
cat -e sample.txt > result.txt
./s21_cat -e sample.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt sample.txt

echo "CAT_TEST_20 -n"
cat > sample.txt << EOF
            
            1234


EOF
cat -n sample.txt > result.txt
./s21_cat -n sample.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt sample.txt

echo "CAT_TEST_21 -b"
cat > sample.txt << EOF
            
            1234


EOF
cat -b sample.txt > result.txt
./s21_cat -b sample.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt sample.txt

echo "CAT_TEST_22 -v "
cat -v ../common/t1_cat.txt > result.txt
./s21_cat -v ../common/t1_cat.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_23 -t "
cat -t ../common/t1_cat.txt > result.txt
./s21_cat -t ../common/t1_cat.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_24 -e "
cat -e ../common/t1_cat.txt > result.txt
./s21_cat -e ../common/t1_cat.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_25 -tev "
cat -etv ../common/t1_cat.txt > result.txt
./s21_cat -etv ../common/t1_cat.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_27 -etvn"
cat -etvn ../common/t1_cat.txt > result.txt
./s21_cat -etvn ../common/t1_cat.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_28 -etvb"
cat -etvb ../common/t1_cat.txt > result.txt
./s21_cat -etvb ../common/t1_cat.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt

echo "CAT_TEST_29 -etvbn"
cat -etvbn ../common/t1_cat.txt > result.txt
./s21_cat -etvbn ../common/t1_cat.txt > s21_result.txt
if diff -q result.txt s21_result.txt ; then
 echo "OK\n"
else
 echo "WARNING\n"
fi
rm result.txt s21_result.txt