import 'package:covid_updates/Models/news.model.dart';
import 'package:flutter/material.dart';

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
    return Card(
      child: Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 300,
          color: Colors.black,
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
                top: 150,
                left: 10,
                child: Container(
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
                        style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 10,
                child: Container(
                    child: Text("${widget.article.publishedAt}",
                        style: Theme.of(context).textTheme.body1.copyWith(
                              color: Colors.white,
                            ))),
              )
            ],
          )),
    );
  }
}
