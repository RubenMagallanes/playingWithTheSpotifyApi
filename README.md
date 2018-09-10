# Playing with the spotify Api lol

manually create and populate the following files: `clientId`, `clientSecret`, `playlistId`

steps to get full playlist JSON: 
(`./<script to run>` -> `<file created by script>` : <file contents>)
- `./genBase64.sh` -> `base64client` : base64 encoded string containing `clientId:clientSecret`
- `./RequestAppAuth.sh` -> `authResponse` : JSON reposnse from the API
- `./extractToken.sh` -> `token` : your auth token
- `./getPlaylist.sh` -> `playlist` : API response with playlist, in JSON
