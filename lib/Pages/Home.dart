import 'package:fill_in_it/Constants/Constants.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Fill'in It", style: TextStyle(color: textcolor,fontSize: 30,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
