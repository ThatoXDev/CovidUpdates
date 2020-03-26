import 'package:flutter/material.dart';

 
class accreditations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('References | Data Provider'),
        
        backgroundColor: Colors.blueAccent,
      ), 
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(' \n Contributor - ashish khuraishy, \n App Scaled down & Modefied by - Reposition ICT SA \n www.repositionict.co.za  \n News Feeds provided by Newsapi.org \n Covid19 information from WHO '),
     
          ],
        ),
      ),
    );
  }
}