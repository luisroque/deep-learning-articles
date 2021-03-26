# Filter characters that have more than 100 images
# create train and test folder
# copy all files that respect the filter to train
# copy 50 files of each character for the test folder
mkdir train ;
mkdir test ;
echo "Create train folder" ;
for i in ./data/* ; do
	if [ $(find "$i" -type f | wc -l) -gt 100 ] ; 
	then 
		find "$i" -type d | xargs -i cp -r "{}" ./train ; 
	fi ; 
done ;
IFS="/" ;
echo "Create test folder" ;
for i in ./train/* ; do
        read var1 var2 var3 <<< "$i" ;
	mkdir ./test/$var3 ;
	find "$i" -type f | tail -50 | xargs -i mv "{}" ./test/$var3 ;
done
