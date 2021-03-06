import 'package:covid_updates/Models/news.model.dart';
import 'package:covid_updates/Screens/accreditations.dart';
import 'package:covid_updates/Widgets/articles.dart';
import 'package:covid_updates/Widgets/homeNavItems.dart';
import 'package:covid_updates/Widgets/requirements.dart';
import 'package:flutter/material.dart';
import 'package:covid_updates/Services/news.service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
  print(width);


    return Scaffold(
      backgroundColor: Color(0xFF1E3CFF),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/prov");
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Color(0xFF1E3CFF),
                  child: Column( 
                    children: <Widget>[
                      Container(
                        width: width,
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'SA COVID - 19 ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith( 
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100),
                                ),
                                 
                                //add references here, project owner, data provider
                                IconButton(icon: Icon(Icons.info, size: 28, color: Colors.orangeAccent,), onPressed: (){
                                 accredPage(context); 
                                },
                                
                                )
                                    
                              ],
                            ),
                            SizedBox(
                              height: 32.0,
                            ),
                            HomeNavItems(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container( 
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Requirements",
                              style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "To Prevent the spread of Covid-19",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                          ],
                        ),
                      ),
                      Requirements(),
                      Container(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'News',
                              style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            FutureBuilder(
                                future: getCovidNews(),
                                builder: (context,
                                    AsyncSnapshot<CovidNews> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot != null && snapshot.hasData) {
                                      return Column(
                                          children: snapshot.data.articles
                                              .map<Widget>((art) =>
                                                  Articles(article: art))
                                              .toList());
                                    } else {
                                      return error404("No articles");
                                    }
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
  
  accredPage (context)  {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Accreditations()));
}

  Widget error404(String s) {
    return Container(child: Text(s));
  }
}
