cat playlistTracks | jq \
	'.items | \
	.[] | \
	.track | \
	{name: .name, id: .id}' \
	| jq -s \
	> trackNameAndId

	# 2	index into items array
	# 3	enumerate array
	# 4	foreach track object
	# 5	transform into objects with name, id fields
	# 6	wrap entire output stream in array
	# 7	output to file
