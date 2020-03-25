import 'package:covid_updates/Models/reportModel.dart';
import 'package:covid_updates/Services/reports.dart';
import 'package:covid_updates/Widgets/chart.dart';
import 'package:covid_updates/Widgets/details.dart';
import 'package:covid_updates/Widgets/lineChart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MzansiReportPage extends StatefulWidget {

  @override
  _MzansiReportPageState createState() => _MzansiReportPageState();
}

class _MzansiReportPageState extends State<MzansiReportPage> {

  Map data = {};
  Report _report;
  CountryReport _countryReport;
  CountryHistory _countryHistory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }
  // @override
  // void didChangeDependencies() {
  //   data = ModalRoute.of(context).settings.arguments;
  //   _countryReport = data['countryReports'];
  //   print(_countryReport.countryName);

  //   _setReport();
  //   _fetchHistory();
  //   super.didChangeDependencies();
  // }
  void initialize() async{
    _countryReport = await getSAreport();
    
    _setReport();
    _fetchHistory();
  }
  void _setReport(){
    setState(() {
      _report = new Report(
        deaths: _countryReport.deaths,
        confirmed: _countryReport.confirmed,
        recovered: _countryReport.recovered,
        totalCases: _countryReport.totalCases,
      );
  
    });
  }

  void _fetchHistory() async {
    CountryHistory temp = await getCountryHistoryReport("South Africa");
    if (!mounted) { return; }
    setState(() {
      _countryHistory = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'South Africa',
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: _report != null
          ? SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      PieChartSample2(_report),
                      SizedBox(
                        height: 16.0,
                      ),
                      Details(report :_report,todayAffeced : _countryReport.todayCases, todayDeaths : _countryReport.todayDeaths),
                      _countryHistory == null ? CircularProgressIndicator() : HistoricalChart(history: _countryHistory),
                      Container(
                        child: Image.asset('assets/images/covidmap.png'),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}