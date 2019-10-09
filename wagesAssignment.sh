#manipulate data in wages.csv
#usage: bash wagesAssignment.sh

cat wages.csv | cut -d , -f 1,2 | sed 's/,/ /g' | sort -k 1 | uniq  > genderExpCombos.txt
cat genderExpCombos.txt | grep "female" | sort -k 2n > genderExp.txt
cat genderExpCombos.txt | grep "^male" | sort -k 2n >> genderExp.txt  
cat genderExp.txt
