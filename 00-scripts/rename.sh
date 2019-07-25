## rename file from demultiplexing from barcode to indivudal tag
## name of the file will be compatible with dDocent workflow

#argument 1 : path of the results 04-all_samples/species
#argument 2 : path of the infos files 01-info_files/species_infos.csv

mkdir $1
awk 'NR>1 { print $1"\t"$2"\t"$3"\t"$4}' $2 | while read LANE BARCODE POP SAMPLE ;
do
	FILE_SE=`ls $(pwd)/03-samples/$LANE | grep "sample_"$BARCODE".fq.gz"`
 	if [ -z "$FILE_SE" ]
	then
		echo $FILE_SE" is empty"
	else
		PATH_SE=$(pwd)/03-samples/$LANE/$FILE_SE
		echo $PATH_SE
		echo $1"/"$POP"_"$SAMPLE".F.fq.gz"
	fi
done