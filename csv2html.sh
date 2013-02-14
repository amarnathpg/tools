#!/bin/sh

input=$1
output="`echo $1 | cut -d"." -f1`.html"
htmlstart="<html>"
htmlend="</html>"
bodystart="<body>"
bodyend="</body>"
tableprop="border=\"1\" cellpadding=\"5\" cellspacing=\"0\" style=\"width:auto;\""  #width=\"100%\""
trs="<tr onMouseOver=\"this.bgColor='#E0E0E0'; font='white'\" onMouseOut=\"this.bgColor='white'\">"
tre="</tr>"
tds="<td style=\"width:auto;\">"
tde="</td>"
br="<br/>"
sdlm=";"

function chkdelimiter {
	if [[ -z $2 ]];then
		dlm=","
	else
		dlm="$2"
	fi
}

if [[ -n $input && -n $output ]]; then
	rm -f $output
	echo "$htmlstart$bodystart<table $tableprop>" > $output
	chkdelimiter
	count=1
	while read line;
	do
		echo $trs
		c=1
		flds=`echo $line | sed "s/[^$dlm]//g" | wc -c`
		while [[ $c -le $flds  ]];
		do
			echo $tds
			echo $line | cut -d"$dlm" -f$c | sed "s:$sdlm:$sdlm$br:g"
			echo $tde
			c=$(($c+1))
		done
		echo $tre	  
		count=$(($count+1))
	done < $input >> $output
	echo "</table>$bodyend$htmlend" >> $output
else
	echo "USAGE:: $0 <input-csv-file>"
	echo "USAGE:: $0 <input-csv-file> <delimiter>"
fi

