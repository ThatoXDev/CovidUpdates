import 'package:flutter/material.dart';

class Requirements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .5 - 40;

    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: width,
                child: getRequirementItems(
                    context: context,
                    text:
                        'If you suspect that you are infected with Covid-19 use surgical Masks to cover your mouth',
                    imgSrc: 'mask',
                    bgColor: Colors.red[100],
                    imgColor: Colors.red[700]),
              ),
              Container(
                width: width,
                child: getRequirementItems(
                    context: context,
                    text:
                        'If you suspect that you are infected with Covid-19  wear gloves',
                    imgSrc: 'gloves',
                    bgColor: Colors.amber[100],
                    imgColor: Colors.amber[700]),
              ),
            ]),
        SizedBox(
          height: 20,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: width,
                child: getRequirementItems(
                    context: context,
                    text: 'Use 60% or more alchohol based hand Sanitizer',
                    imgSrc: 'alchohol',
                    bgColor: Colors.blue[100],
                    imgColor: Colors.blue[700]),
              ),
              Container(
                width: width,
                child: getRequirementItems(
                    context: context,
                    text: 'Wash your hands with regularly Soap & Water',
                    imgSrc: 'soap',
                    bgColor: Colors.grey[300],
                    imgColor: Colors.grey[700]),
              ),
            ]),
      ],
    );
  }
}

Widget getRequirementItems(
    {BuildContext context,
    String text,
    String imgSrc,
    Color bgColor,
    Color imgColor}) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
        ),
        child: Image(
          image: AssetImage('assets/images/$imgSrc.png'),
          height: 32,
          fit: BoxFit.contain,
          color: imgColor,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(text, style: Theme.of(context).textTheme.subtitle, softWrap: true),
    ],
  );
}
