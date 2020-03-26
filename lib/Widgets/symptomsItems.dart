import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SymptomsItems extends StatefulWidget {
  @override
  _SymptomsItemsState createState() => _SymptomsItemsState();
}

class _SymptomsItemsState extends State<SymptomsItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[ 
        getSymptomsItems(context, 'Do you have fever'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Do you have a dry cough'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Do you feel tiredness'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Do you have difficulty Breathing'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, "Do not smoke or do activities that weaken your lung!s")
      ],
    );
  }
}


class PreventionItems extends StatefulWidget {
  @override
  _PreventionItemsState createState() => _PreventionItemsState();
}

class _PreventionItemsState extends State<PreventionItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        getSymptomsItems(context, 'Wash hands often with soap and water'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Cough into elbow'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, "Don't touch your face"),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Keep a safe distance of 3 feet or 1 meter from people who cough & sneez'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Stay home if you can'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, "Refrain from smoking and other activities that weaken the lungs"),
                SizedBox(height: 16.0,),

      ],
    );
  }
}

Widget getSymptomsItems(BuildContext context, String text) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xFF1A35E4),
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    child: ListTile(
      leading: Icon(
        Icons.error,
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

void launchUrl() async{
  const url = 'https://www.who.int/news-room/q-a-detail/q-a-coronaviruses';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
