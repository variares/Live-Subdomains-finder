#! /bin/bash
red=$`tput setaf 1`
green=$`tput setaf 2`
blue=$`tput setaf 4`
reset=$`tput sgr0`
greetings(){
echo "Welcome `tput setaf 1` $USER! `tput sgr0`. You are using `tput setaf 6` LIVE SUBDOMAINS FINDER `tput sgr0` coded by `tput setaf 3` Variares `tput sgr0`" 
echo "Please make sure you have `tput setaf 4`'assetfinder'`tput sgr0` and `tput setaf 4`'httprobe'`tput sgr0` installed in your system"
}
greetings 
echo =============================================================================
read -p "`tput setaf 5` Enter the Domain `tput sgr0` : " dom
echo " `tput setaf 4` It may take a while depending on the number of subdomains. Sit back and relax :) `tput sgr0` "
end()
{
echo " `tput sgr0` ==== `tput setaf 3` Process Completed!. Thank you for using `tput sgr0` `tput setaf 6` LIVE SUBDOMAINS FINDER`tput sgr0` ===="
}
step1()
{
assetfinder --subs-only $dom > subs.txt
}
step2()
{
cat subs.txt | httprobe `tput sgr0` > live_subs.txt
}
step3()
{
while read url ; do
	echo ${url#*//} >> urls.txt
done < live_subs.txt
sort -u urls.txt > sorted_subs.txt
echo "++++++++  Live Subdomains of `tput setaf 5` $dom `tput sgr0` ++++++++" `tput setaf 2`
cat  sorted_subs.txt 
echo "`tput setaf 4`======================================== `tput sgr0`"
echo "Result saved in `tput setaf 1` live_subs.txt `tput sgr0`"
rm urls.txt
rm live_subs.txt
rm subs.txt
}
step1
step2
step3
end