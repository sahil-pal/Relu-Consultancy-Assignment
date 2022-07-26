import 'package:flutter/material.dart';
import 'package:music_app/config/constants/app_constants.dart';
import 'package:music_app/model/song.dart';
import 'package:music_app/services/song_client.dart';

class SongsList extends StatelessWidget {
  const SongsList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SongClient songClient = SongClient.getSongRepositoryInstance();

    return FutureBuilder(
      future: songClient.getTrendingSongs(),
      builder: (BuildContext context,AsyncSnapshot<List<Song>> songSnapShot){
        if(songSnapShot.hasData){
          return _printSongs( songSnapShot.data!);
        }
        else{
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  _printSongs(List<Song> songList){
    return ListView.builder(
      itemCount: songList.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(
              context, RouteConstants.SONG_LYRICS,
              arguments: {
                "trackID" : songList[index].trackID
              }
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ListTile(
              tileColor: Colors.grey.shade300,
              leading: const Icon(Icons.music_note_rounded),
              iconColor: Colors.blueGrey,
              title: Text(songList[index].name),
              subtitle: Text(songList[index].album),
              trailing: Text(songList[index].artists)
            ),
          ),
        );
      })
    );
  }

}