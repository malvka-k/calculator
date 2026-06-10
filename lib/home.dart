import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(context,MaterialPageRoute(builder:(context) =>  Home(), ));
    },);
    return Scaffold(backgroundColor: Colors.blue);
  }
}