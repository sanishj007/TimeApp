import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {




  @override
  Widget build(BuildContext context) {
    print('init build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:RaisedButton(
        onPressed: (){
          setState(() {
          });
        },
        child: Text('counter is'),
      )
    );
  }
}
