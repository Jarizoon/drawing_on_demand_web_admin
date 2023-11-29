import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:flutter/material.dart';

class ArtistRegisterDetail extends StatefulWidget{
  const ArtistRegisterDetail({Key? key}) : super(key: key);

  @override
  State<ArtistRegisterDetail> createState () => _ArtistRegisterDetailState();
}

class _ArtistRegisterDetailState extends State<ArtistRegisterDetail>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(),
              ],
            ),
          ),
        ), 
      ),
    );
  }
}