class Song{

  late int trackID;
  late String name;
  late String album;
  late String artists;
  late bool explicit;
  late int rating;
  late String lyrics;

  Song(
    {
      required this.trackID,
      required this.name,
      required this.album,
      required this.artists,
      this.explicit = false,
      this.rating = 0,
      this.lyrics = ""
    }
  );

  Song.fromJSON(Map<String,dynamic> songMap,String lyricsBody){
      trackID =  songMap['track_id'];
      name =  songMap['track_name'];
      album =  songMap['album_name'];
      artists =  songMap['artist_name'];
      explicit =  (songMap['explicit'] == 0) ? false : true;
      rating =  songMap['track_rating'];
      lyrics = lyricsBody;
  }

  Song.fromSongList(Map<String,dynamic> songMap){
      trackID = songMap['track_id'];
      name =  songMap['track_name'];
      album = songMap['album_name'];
      artists = songMap['artist_name'];
  }

  @override
  String toString() {
    return "$trackID $name";
  }

}