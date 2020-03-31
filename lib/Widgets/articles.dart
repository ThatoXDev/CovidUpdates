import 'package:covid_updates/Models/news.model.dart';
import 'package:covid_updates/Screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class Articles extends StatefulWidget {
  Article article;
  Articles({@required this.article});
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 60;
    String url = widget.article.url;
    DateTime dt = DateTime.parse(widget.article.publishedAt);
    var timePublished = timeago.format(dt);

    return GestureDetector(
      onTap: () async {
        // if (await canLaunch(url)) {
        //   await launch(url);
        // } else {
        //   throw 'Could not launch $url';
        // }
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Webview(widget.article)));
      },
      child: Container(
          color: Colors.black54,

          margin: EdgeInsets.only(bottom: 20),
          height: 250,
          child: Stack(
            children: <Widget>[
              Container(

                decoration: BoxDecoration(
                  color: Colors.black38,
                  image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: NetworkImage(widget.article.urlToImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.only(right:5),
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${widget.article.source.name}",
                        style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.article.title}",
                        softWrap: true,
                        style: Theme.of(context).textTheme.subhead.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),SizedBox(
                        height: 10,
                      ),
                      Container(
                    child: Text("$timePublished",
                        style: Theme.of(context).textTheme.body1.copyWith(
                              color: Colors.white,
                            ))),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   bottom: 10.0,
              //   left: 10,
              //   child: Container(
              //       child: Text("$timePublished",
              //           style: Theme.of(context).textTheme.body1.copyWith(
              //                 color: Colors.white,
              //               ))),
              // )
            ],
          )),
    );
  }
}
