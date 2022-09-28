import 'package:fill_in_it/Constants/Constants.dart';
import 'package:flutter/material.dart';

class Confirm extends StatefulWidget {
  const Confirm({Key? key}) : super(key: key);

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iconcolor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You Have Successfully Completed!!', style: TextStyle(
                color: textcolor,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Icon(Icons.check,color: Colors.white,size: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
