import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/cubit/connection_cubit.dart';
import 'package:music_app/cubit/connection_state.dart';
import 'package:music_app/widgets/no_internet.dart';
import 'package:music_app/widgets/songs_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      title: const Text(
        'Trending',
        style: TextStyle(fontSize: 24,letterSpacing: 3,fontWeight: FontWeight.bold),
      )
    ),
    body: SafeArea(
      child: BlocBuilder<ConnectionCubit,ConnectionStates>(
      builder: ((context, state) {
          if(state is SuccessConnectionState){
            return const SongsList();
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