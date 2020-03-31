import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Provinces extends StatefulWidget {
  @override
  _ProvincesState createState() => _ProvincesState();
}

class _ProvincesState extends State<Provinces> {
  final TextEditingController gp = new TextEditingController();
  TextEditingController mp = new TextEditingController();
  TextEditingController fs = new TextEditingController();
  TextEditingController ec = new TextEditingController();
  TextEditingController wc = new TextEditingController();
  TextEditingController nc = new TextEditingController();
  TextEditingController lim = new TextEditingController();
  TextEditingController nw = new TextEditingController();
  TextEditingController kzn = new TextEditingController();
  TextEditingController unknown = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provinces"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Add Provincial Data",
                    style: Theme.of(context).textTheme.display1.copyWith(
                        color: Colors.black87, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _textfield("Gauteng", gp),
                  _textfield("Western Cape", wc),
                  _textfield("Kwa-Zulu Natal", kzn),
                  _textfield("Free State", fs),
                  _textfield("North West", nw),
                  _textfield("Mpumalanga", mp),
                  _textfield("Limpopo Cape", lim),
                  _textfield("Northern Cape", nc),
                  _textfield("Eastern Cape", ec),
                  _textfield("Unknown", unknown),
                  _submit()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _row() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Free Sate"),
        Text("Free Sate"),
      ],
    ));
  }

  Widget _submit() {
    return RaisedButton(
        onPressed: () async {
          print("RORO " + gp.text.isEmpty.toString());
          print("RORO " + wc.text.isEmpty.toString());
          print("RORO " + kzn.text.isEmpty.toString());
          print("RORO " + fs.text.isEmpty.toString());
          print("RORO " + nc.text.isEmpty.toString());
          if (!gp.text.isEmpty &&
              !kzn.text.isEmpty &&
              !fs.text.isEmpty &&
              !wc.text.isEmpty &&
              !nc.text.isEmpty &&
              !ec.text.isEmpty &&
              !lim.text.isEmpty &&
              !nw.text.isEmpty &&
              !mp.text.isEmpty &&
              !unknown.text.isEmpty) {
            print(gp.text);
            print(ec.text);
            print(mp.text);
            print(kzn.text);
            print(fs.text);
            print(nc.text);
            print(wc.text);
            print(lim.text);
            print(nw.text);
            print(unknown.text);
            var url = "https://parseapi.back4app.com/classes/CoronaSA";
            Map<String, String> headers = {
              'X-Parse-Application-Id':
                  '8opHm1HwqFyzNsXHrb948vN9kEBaM5vYSkVvDdrv',
              'X-Parse-REST-API-Key':
                  'MLCdEcY6rnlhXqXdDjyrTjfU2FMWKir9RQ4N5HDF',
            };

            var body = {
              "fs": fs.text,
              "gp": gp.text,
              "kzn": kzn.text,
              "mp": mp.text,
              "lim": lim.text,
              "nc": nc.text,
              "ec": ec.text,
              "wc": wc.text,
              "nw": nw.text,
              "unknown": unknown.text
            };
            var response = await http.post(url, headers: headers, body: json.encode(body));
            print(response);
            AlertDialog d = AlertDialog(content: Text("Data saved successfully"), title: Text("Results"), actions: <Widget>[
              MaterialButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"),)
            ],);

            showDialog(context: context, builder: (context) => d,);
          } else {
            print("Write zero for no cases");
          }
        },
        child: Text("Save", style: Theme.of(context).textTheme.button));
  }

  Widget _textfield(String province, TextEditingController ctrl) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(
          fillColor: Colors.blue,
          border: OutlineInputBorder(),
          labelText: "$province",
        ),
      ),
    );
  }
}
 