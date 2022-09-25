import 'package:fill_in_it/Constants/Constants.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   _steps() => [
    Step(
      isActive: _currentStep==0,
      state: _stepState(0),
      title: Text('Address'),
      content: Container(
            child: Text('This is 1st step'),),
  ),
  Step(
    isActive: _currentStep==1,
    state: _stepState(1),
      title: Text('basic'),
    content: Container(
          child: Text('This is 2nd step'),),
  ),
    Step(
      isActive: _currentStep==2,
      state: _stepState(2),
      title: Text('Checkout'),
      content: Container(
        child: Text('This is 3rd step'),),
    ),
  ];

  int _currentStep=0;
  StepState _stepState(int step){
    if(_currentStep> step){
      return StepState.complete;
    }
    return StepState.editing;
  }

  void onStepContinue(){
    if(_currentStep< _steps().length-1){
      setState(() {
        _currentStep++;
      });
    }else{
      setState(() {
        _currentStep=0;
      });
    }
  }

  void onStepCancel(){
    if(_currentStep>0){
      setState(() {
        _currentStep--;
      });
    }else{
      print('You cannot go back!!');
    }
  }

  void onStepTapped(int index){
    setState(() {
      _currentStep=index;
    });
  }

  Widget controlsBuilder(BuildContext context , ControlsDetails controlDetails){
    return Padding(padding: EdgeInsets.symmetric(vertical: 16),
  child: Row(
  children: [
    ElevatedButton(onPressed: controlDetails.onStepContinue, child: Text('Next')),
  if(_currentStep != 0)
    TextButton(onPressed: controlDetails.onStepCancel,child: Text('Back'),),

  ],
  ),);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Fill'in It", style: TextStyle(color: textcolor,fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body:Stepper(
        controlsBuilder: controlsBuilder,
        currentStep: _currentStep,
          steps: _steps(),
        onStepContinue: onStepContinue,
        onStepCancel: onStepCancel,
        onStepTapped: onStepTapped,
        ),
      );



  }
}
