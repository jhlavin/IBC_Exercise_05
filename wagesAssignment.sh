#manipulate data in wages.csv
#usage: bash wagesAssignment.sh

#Returns unique gender and years of experience combos

#cat wages.csv | cut -d , -f 1,2 | sed 's/,/ /g' | sort -k 1 | uniq  > genderExpCombos.txt
#cat genderExpCombos.txt | grep "female" | sort -k 2n > genderExp.txt
#cat genderExpCombos.txt | grep "^male" | sort -k 2n >> genderExp.txt
#cat genderExp.txt

cat wages.csv | cut -d , -f 1,2 | sed 's/,/ /g' | sort -k 1 | uniq | grep "female" | sort -k 2n > genderExp.txt
cat wages.csv | cut -d , -f 1,2 | sed 's/,/ /g' | sort -k 1 | uniq | grep "^male" | sort -k 2n >> genderExp.txt

#Returns gender, experience, and wage of highest and lowest earner and the number of females in the top ten highest earners

echo "Gender, years of experience, and wage of the highest earner"
tail -n +2 wages.csv | cut -d , -f 1,2,4 | sort -k 3 | tail -n 1
echo "Gender, years of experience, and wage of the lowest earner"
tail -n +2 wages.csv | cut -d , -f 1,2,4 | sort -k 3 | head -n 1
echo "The number of females in the top ten earners"
tail -n +2 wages.csv | cut -d , -f 1,2,4 | sort -k 3 | tail -n 10 | grep -c "female"

#Returns the amount by which the minimum wage of a college grad exceeds that of a HS grad

echo "The minimum wage of a college graduate exceeds that of a high school graduate by this amount:"
HSmin=$(grep ",12," wages.csv | cut -d , -f 4 | sort -n | head -n 1 | sed -e "s/\r//g")
Cmin=$(grep ",16," wages.csv | cut -d , -f 4 | sort -n | head -n 1 | sed -e "s/\r//g")
echo "$Cmin - $HSmin" | bc
