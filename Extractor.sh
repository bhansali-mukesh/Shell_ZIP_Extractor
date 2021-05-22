
# This Script Extract All ZIPs from a particular directory ( default is current directory ) into their Respective Directories ( Extract Scripts.zip into "Scripts" Directory )
# Can be Used while Extracting multiple CDs for Windchill Installation

# Take 1 Optional Parameter of Directory Path where ZIPs are Located, Default Path is Current Directory

# Example Run 
# 1.	~/Scripts/Extractor.sh
# 2.	~/Scripts/Extractor.sh /vagrant/Shared/CDs


# Internal File Separator
IFS=$'\n'


PWD=`pwd`

if [ M"$1" != "M" ]
then
	zip_directory="$1"
	cd $zip_directory
fi

for zip in `ls *zip`
do
	#echo "$zip";
	directory="${zip%.*}";
	#echo "$directory";
	mkdir "$directory";
	mv "$zip" "$directory";
	cd "$directory";
	unzip "$zip";
	cd -;
done;

cd $PWD