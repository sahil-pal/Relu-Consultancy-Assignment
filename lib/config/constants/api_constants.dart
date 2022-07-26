import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants{

  static final String trendingSongsList = dotenv.env["SONGS_LIST_API"]!;
  static final String songInfo = dotenv.env["SONG_INFO_API"]!;
  static final String songLyrics = dotenv.env["LYRICS_API"]!;
  static final String apiKey = dotenv.env["API_KEY"]!;
  
}