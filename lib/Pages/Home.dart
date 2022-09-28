import 'package:fill_in_it/Constants/Constants.dart';
import 'package:fill_in_it/Pages/ConfirmationPage.dart';
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
      title: Text('Address',style: TextStyle(color: textcolor, fontSize: 20, fontWeight: FontWeight.w500),),
      content: Container(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: InputBorder.none,
                     labelStyle: TextStyle(fontSize: 20)
                  ),
                ),
              ],
            )),
  ),
  Step(
    isActive: _currentStep==1,
    state: _stepState(1),
      title: Text('Basic Details',style: TextStyle(color: textcolor, fontSize: 20, fontWeight: FontWeight.w500),),
    content: Container(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: InputBorder.none,
                  labelStyle: TextStyle(fontSize: 20)
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Phone No.',
                  border: InputBorder.none,
                    labelStyle: TextStyle(fontSize: 20)

                ),
              ),

            ],
          ),),
  ),
    Step(
      isActive: _currentStep==2,
      state: _stepState(2),
      title: Text('Checkout',style: TextStyle(color: textcolor, fontSize: 20, fontWeight: FontWeight.w500),),
      content: Container(),
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
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Confirm()));
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
        // if(_currentStep != _steps().length-1)
          ElevatedButton(onPressed: controlDetails.onStepContinue,
            child: _currentStep < _steps().length-1 ? Text('Next',
              style: TextStyle(color: textcolor,fontSize: 18,fontWeight: FontWeight.w500),) :
            Text('Confirm',
              style: TextStyle(color: textcolor,fontSize: 18,fontWeight: FontWeight.w500),),
            style:ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(buttoncolor),
            ) ,),

      if(_currentStep != 0)
         TextButton(onPressed: controlDetails.onStepCancel,child:
         Text('Back', style: TextStyle(color: textcolor,fontSize: 18,fontWeight: FontWeight.w500),),),

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
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: iconcolor),
        ),
        child: Stepper(
            controlsBuilder: controlsBuilder,
            currentStep: _currentStep,
              steps: _steps(),
            onStepContinue: onStepContinue,
            onStepCancel: onStepCancel,
            onStepTapped: onStepTapped,
            ),
      ),
    );




  }
}
