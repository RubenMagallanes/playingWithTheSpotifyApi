#this file needs rewrite
#	-> get 100 songs from playlist, extract IDs, get song info, dump to file
#	-> enter while loop, get next 100 , extract ids, get song info, dump to file

# open new json object in new file
echo '{' > items

# dump tracks array to file
cat playlistTracks | jq '.items' >> items

# get next page url
cat playlistTracks | jq -r .next > nextUrl

#TODO this may remove all last items of each line?
# remove trailing ']' so we can keep appending to the array
sed -i '$ s/.$//' items

#while there is a next page
while [ $(<nextUrl) != 'null' ]
do
	#call api to get next page
	curl \
		-X GET $(<nextUrl) \
		-H "Accept: application/json" \
		-H "Content-Type: application/json" \
		-H "Authorization: Bearer $(<token)" \
		> playlistTracks
	
	# store new lot of items in tempfile
	cat playlistTracks | jq '.items' >> itemsTemp 

	#remove first '[' char in file
	sed -i 's/^.//' itemsTemp
	
	# remove trailing ']' so we can keep appending to the array
	sed -i '$ s/.$//' itemsTemp

	# dump tracks to file
	cat itemsTemp >> items

	# dump next url to file
	cat playlistTracks | jq -r .next > nextUrl
done
# close array & object
echo ']}' >> items 

