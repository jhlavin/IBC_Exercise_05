#manipulate data in wages.csv
#usage: bash wagesAssignment.sh

cat wages.csv | cut -d , -f 1,2 | sed 's/,/ /g' | sort -k 1 > genderExpCombos.txt
cat genderExpCombos.txt | 
