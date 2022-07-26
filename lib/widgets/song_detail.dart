import 'package:flutter/material.dart';
import '../model/song.dart';
import '../services/song_client.dart';

class SongDetail extends StatelessWidget {

  late int trackID;
  late Size deviceSize;

  SongDetail(this.trackID, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SongClient songClient = SongClient.getSongRepositoryInstance();
    deviceSize = MediaQuery.of(context).size;

    return FutureBuilder(
      future: songClient.getSongDetail(trackID),
      builder: (BuildContext context,AsyncSnapshot<Song> songSnapShot){
        if(songSnapShot.hasData){
          return _printSong(songSnapShot.data!);
        }
        else{
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  _printSong(Song song){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: deviceSize.width*0.04,vertical: deviceSize.height*0.03),
      padding: EdgeInsets.all(deviceSize.width*0.02),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getHeading('Name'),
            _printValue(song.name),
            _getHeading('Artist'),
            _printValue(song.artists),
            _getHeading('Album Name'),
            _printValue(song.album),
            _getHeading('Explicit'),
            _printValue(song.explicit.toString()),
            _getHeading('Ratings'),
            _printValue(song.rating.toString()),
            const SizedBox(height: 10,),
            _getHeading('Lyrics'),
            _printValue(song.lyrics)
          ],
        ),
      )
    );
  }

  _getHeading(String text){
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.grey
      ),
    );
  }

  _printValue(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black
      ),
    );
  }

}