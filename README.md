# Home Assessment

Show a page with an input field and a submit button. In that input field the user can type the name of an album or an artist. Submitting it will show all the iTunes albums that match the submitted name and all the albums of the artists that match the submitted name. Use the search iTunes API (https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/Searching.html).
The items to show in the album result list:
1. Leading thumbnail: use artworkUrl100
2. Title: use collectionName
3. Subtitle: use the artist name
4. Favourite icon/button: the favourite state of an album should be stored in database

For simplicity no login is required. We will assume a single user system