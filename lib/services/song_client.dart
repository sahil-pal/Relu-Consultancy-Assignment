import 'dart:convert' as jsonconvert;
import 'package:http/http.dart' as http;
import 'package:music_app/config/constants/api_constants.dart';
import '../model/song.dart';

class SongClient{

  static SongClient songClient = SongClient();

  static SongClient getSongRepositoryInstance(){
    return songClient;
  }

  _SongClient(){}

  Future<List<Song>> getTrendingSongs() async{

    final String path = "${ApiConstants.trendingSongsList}apikey=${ApiConstants.apiKey}";
    Uri url = Uri.parse(path);

    http.Response response = await http.get(url);
    String json = response.body;
    Map<String,dynamic> data = jsonconvert.jsonDecode(json);
    List<dynamic> list = data["message"]["body"]["track_list"];
    List<Song> trendingSongList = list.map((song) => Song.fromSongList(song["track"])).toList();

    return trendingSongList;
  }

  Future<Song> getSongDetail(int trackID) async{

    final String pathSongInfo = "${ApiConstants.songInfo}track_id=$trackID&apikey=${ApiConstants.apiKey}";
    Uri urlSongInfo = Uri.parse(pathSongInfo);

    final String pathSongLyrics = "${ApiConstants.songLyrics}track_id=$trackID&apikey=${ApiConstants.apiKey}";
    Uri urlSongLyrics = Uri.parse(pathSongLyrics);

    http.Response responseSongInfo = await http.get(urlSongInfo);
    http.Response responseSongLyrics = await http.get(urlSongLyrics);

    String jsonSongInfo = responseSongInfo.body;
    String jsonSongLyrics = responseSongLyrics.body;
    
    Map<String,dynamic> dataSongInfo = jsonconvert.jsonDecode(jsonSongInfo);
    Map<String,dynamic> dataSongLyrics = jsonconvert.jsonDecode(jsonSongLyrics);

    Song song = Song.fromJSON(dataSongInfo["message"]["body"]["track"],dataSongLyrics["message"]["body"]["lyrics"]["lyrics_body"]);
    
    return song;
  }

}