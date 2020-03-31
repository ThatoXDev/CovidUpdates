import 'dart:async';

import 'package:covid_updates/Screens/CountryReportPage.dart';
import 'package:covid_updates/Screens/countriesPage.dart';
import 'package:covid_updates/Screens/homePage.dart';
import 'package:covid_updates/Screens/mzansi.page.dart';
import 'package:covid_updates/Screens/preventionPage.dart';
import 'package:covid_updates/Screens/provinces.dart';
import 'package:covid_updates/Screens/reportPage.dart';
import 'package:covid_updates/Screens/symptomsPage.dart';
import 'package:covid_updates/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() { 
 
    runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{ 
      '/homePage': (BuildContext context) => new HomePage(),
         '/reports': (context) => ReportPage(),
         '/symptoms': (context) => SymptomsPage(),
         '/prevention': (context) => PreventioPage(),
         '/countries' : (context) => Countriespage(),
         '/countryReport' : (context) => CountryReportPage(),
         '/mzansi' : (context) => MzansiReportPage(), 
    },
  ));
} 



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5); 
    return new Timer(_duration, navigationPage);
  } 

  void navigationPage() {   
    Navigator.of(context).pushReplacementNamed('/homePage');
    
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center( 
        child: new Image.asset('assets/images/logoRepos.png', 
        height: 230,  
        width: 230,), 
        
      ),
      
    );
  
  } 

} 

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Updates',
      theme: ThemeData(
        primaryColor: Color(0xFF1E3CFF),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme
        ), 
      ),
      debugShowCheckedModeBanner: false,
      routes: {  
         '/': (context) => HomePage(),   
         //'/homepage': (context) => HomePage(),
         '/reports': (context) => ReportPage(),
         '/symptoms': (context) => SymptomsPage(),
         '/prevention': (context) => PreventioPage(),
         '/countries' : (context) => Countriespage(),
         '/countryReport' : (context) => CountryReportPage(),
         '/mzansi' : (context) => MzansiReportPage(),
         '/prov' : (context) => Provinces(),
      },
    ); 
  }
} 


