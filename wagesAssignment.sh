#manipulate data in wages.csv
#usage: bash wagesAssignment.sh

#Returns unique gender and years of experience combos

#cat wages.csv | cut -d , -f 1,2 | sed 's/,/ /g' | sort -k 1 | uniq  > genderExpCombos.txt
#cat genderExpCombos.txt | grep "female" | sort -k 2n > genderExp.txt
#cat genderExpCombos.txt | grep "^male" | sort -k 2n >> genderExp.txt  
#cat genderExp.txt

cat wages.csv | cut -d , -f 1,2 | sed 's/,/ /g' | sort -k 1 | uniq | grep "female" | sort -k 2n > genderExp.txt
cat wages.csv | cut -d , -f 1,2 | sed 's/,/ /g' | sort -k 1 | uniq | grep "^male" | sort-k 2n >> genderExp.txt

#Returns gender, experience, and wage of highest and lowest earner and the number of females in the top ten highest earners

echo "Gender, years of experience, and wage of the highest earner"
tail -n +2 wages.csv | cut -d , -f 1,2,4 | sort -k 3 | tail -n 1
echo "Gender, years of experience, and wage of the lowest earner"
tail -n +2 wages.csv | cut -d , -f 1,2,4 | sort -k 3 | head -n 1
echo "The number of females in the top ten earners"
tail -n +2 wages.csv | cut -d , -f 1,2,4 | sort -k 3 | tail -n 10 | grep -c "female" 

#Returns the effect of graduating college on wage

echo "College graduates make this much more money than highschool graduates on average"
cat wages.csv | grep ",12" | cut -d , -f 4 > highschool.txt
cat wages.csv | grep ",16" | cut -d , -f 4 > college.txt
