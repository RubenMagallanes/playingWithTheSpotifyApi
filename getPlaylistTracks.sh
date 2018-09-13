curl \
	-X GET "https://api.spotify.com/v1/playlists/$(<playlistId)/tracks?fields=items(track(album(name),artists(name,id),id,name))" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer $(<token)" \
> playlistTracks
