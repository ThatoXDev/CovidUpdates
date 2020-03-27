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
    super.initState();
    // initialize();
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
  void initialize() async {
    _countryReport = await getSAreport();

    _setReport();
    _fetchHistory();
  }

  void _setReport() {
    setState(() {
      _report = new Report(
        deaths: _countryReport.deaths,
        confirmed: _countryReport.confirmed,
        recovered: _countryReport.recovered,
        totalCases: _countryReport.totalCases,
      );
    });
  }

  Future<CountryHistory> _fetchHistory() async {
    CountryHistory temp = await getCountryHistoryReport("South Africa");
    return temp;
  }

  Stream getAllData() async* {
    yield* Stream.fromFutures(
        [getSAreport(), getCountryHistoryReport("South Africa")]);
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
        floatingActionButton: FloatingActionButton(onPressed: ()async{

          var jeep = await getCountryHistoryReport("South Africa");
          print(jeep.cases);
          print(jeep.cases);
        }, child: Icon(Icons.place),),
        body: FutureBuilder(
            future: getSAreport(),
            builder: (contex, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  //get history
                  //CountryHistory temp = await getCountryHistoryReport("South Africa");
                  // set country report
                  _countryReport = snapshot.data;
                  _report = new Report(
                    deaths: _countryReport.deaths,
                    confirmed: _countryReport.confirmed,
                    recovered: _countryReport.recovered,
                    totalCases: _countryReport.totalCases,
                  );
                  return SafeArea(
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
                            Details(
                                report: _report,
                                todayAffeced: _countryReport.todayCases,
                                todayDeaths: _countryReport.todayDeaths),
                            FutureBuilder(
                              future: _fetchHistory(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState !=
                                    ConnectionState.done) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: Text(
                                          "Error occured while trying to retrieve data"),
                                    );
                                  } else {
                                    return HistoricalChart(
                                        history: snapshot.data);
                                  }
                                }
                              },
                            ),
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
                  );
                } else {
                  return Center(
                    child: Text("Error while retrieving data"),
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
