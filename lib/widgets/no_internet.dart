import 'package:flutter/material.dart';
import 'package:music_app/config/constants/asset_path.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(AssetPath.NO_CONNECTION));
  }
}