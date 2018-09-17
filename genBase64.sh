if [ -e clientId && -e clientSecret ]
then
	echo -n "$(<clientId):$(<clientSecret)" | base64 -w 0 > base64client
else
	echo "make sure you have the files 'clientId' & 'clientSecret' created and populated with your values from the spotify api dashboard. Ensure there is no newline at the end of either of the files."
fi


