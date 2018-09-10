curl \
	-X GET "https://api.spotify.com/v1/playlists/$(<playlistId)" \
	-H "Accept: application/json" \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer $(<token)" \

> playlist
