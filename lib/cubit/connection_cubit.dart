import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/cubit/connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionStates>{

  late StreamSubscription subscription;
  
  ConnectionCubit() : super(InitialConnectionState()){
    _monitorInternetConnection();
  }

  _monitorInternetConnection() async{
    subscription = Connectivity().onConnectivityChanged.listen((connectionResult){
      if(connectionResult == ConnectivityResult.none){
        internetUnAvailable();
      }
      else{
        internetAvailable();
      }
    });
  }

  void internetAvailable(){
    emit(SuccessConnectionState());
  }

  void internetUnAvailable(){
    emit(FailureConnectionState());
  }
  
}