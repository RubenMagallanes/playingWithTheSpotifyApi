echo '{' > items # topen new json object in new file
cat playlistTracks | jq '.items' >> items # dump tracks to file
cat playlsitTracks | jq -r .next > nextUrl # get next page url
sed -i '$ s/.$//' items # remove trailing ']' so we can keep appending to the array

while [$(<nextUrl) != 'null']
do
	#call api for next page
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
echo ']}' >> items # close array & object

