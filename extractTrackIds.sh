cat playlistTracks | jq '.items | .[] | .track | {name: .name, id: .id}' | jq -s . > trackNameAndId

	#	create file of just track name: id pairings:
	#	index into items array
	#	enumerate array
	#	foreach track object
	#	transform into objects with name, id fields
	#	wrap entire output stream in array
	#	output to file

cat trackNameAndId | jq '.[] | .id' | jq -s . > idArray
	
	#	extract ids to array

sed -i 's/^.//' idArray
	#	delete first character in every line (removing the [,] )
