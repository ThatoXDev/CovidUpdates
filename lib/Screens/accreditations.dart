import 'package:covid_updates/Widgets/refs.dart';
import 'package:flutter/material.dart';

 
class Accreditations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
         backgroundColor: Color(0xFF1E3CFF),
        title: Text('References | Data Provider'),
        
      ), 
      body:Container(
        color: Color(0xFF1E3CFF),
        padding: EdgeInsets.all(10.0),
        child: References(),)
    );
  }
}