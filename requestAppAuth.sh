curl \
	-X POST \
	-H "Authorization: Basic $(<base64client)" \
	-d grant_type=client_credentials \
	https://accounts.spotify.com/api/token \
> authResponse
