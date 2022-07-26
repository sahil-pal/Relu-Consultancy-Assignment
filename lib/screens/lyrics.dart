import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/widgets/song_detail.dart';
import '../cubit/connection_cubit.dart';
import '../cubit/connection_state.dart';
import '../widgets/no_internet.dart';

class SongLyricsScreen extends StatelessWidget {
  const SongLyricsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

   return Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey,
      title: const Text(
        'Details',
        style: TextStyle(fontSize: 24,letterSpacing: 3,fontWeight: FontWeight.bold),
      )
    ),
    body: SafeArea(
      child: BlocBuilder<ConnectionCubit,ConnectionStates>(
      builder: ((context, state) {
          if(state is SuccessConnectionState){
            return SongDetail(arguments["trackID"]);
          }
          else if(state is FailureConnectionState){
            return const NoInternetConnection();
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
        })
      )
    ),
   );
  }

}
