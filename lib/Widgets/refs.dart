import 'package:flutter/material.dart';
class References extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        getSymptomsItems(context, "Project created by Ashish Khuraishy"),
        
        getSymptomsItems(context, "Project forked & scaled down by Reposition ICT - www.repositionict.co.za"),
        getSymptomsItems(context, "News Feed data provided by newsapi.org"),
        getSymptomsItems(context, "Covid-19 data provided by NovelCovid"),
        getSymptomsItems(context, "Covid-19 information from WHO"),
      ],
      
    );
  }

  Widget getSymptomsItems(BuildContext context, String text) {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    decoration: BoxDecoration(
        color: Color(0xFF1A35E4),
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    child: ListTile(
      leading: Icon(
        Icons.info,
        color: Colors.amber,
      ),
      title: Text(
        text,
        style:
            Theme.of(context).textTheme.subhead.copyWith(color: Colors.white),
      ),
      trailing: Icon(
        Icons.chrome_reader_mode,
        color: Colors.white,
      ),
    ),
  );
}
}