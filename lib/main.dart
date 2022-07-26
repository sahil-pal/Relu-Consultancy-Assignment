import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music_app/cubit/connection_cubit.dart';
import 'package:music_app/config/routes/app_routes.dart';
import 'package:music_app/screens/home.dart';


void main() async{
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectionCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: getRoutes(),
        home: const HomeScreen(),
      )
    );
  }
}