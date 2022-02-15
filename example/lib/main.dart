import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const ScreenAndWidgetList(),
    );
  }
}

class ScreenAndWidgetList extends StatelessWidget {
  const ScreenAndWidgetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    /*
    {
        "isWidget": true,
        "className": (SomeWidgetClass).toString(),
        "fn": () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SomeWidgetDemo()));
        }
      },
      */
    var widgetList = [];

    /*
    {
        "isWidget": false,
        "className": (SomeScreenClass).toString(),
        "fn": () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SomeScreenClassDemo()));
        }
      },
      */
    var screenList = [];

    return Scaffold(
      body: Container(
        width: size.width,
        color: Colors.white,
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            {"isLabel": true, "title": "Widgets:"},
            ...widgetList,
            {"isLabel": true, "title": "Screens:"},
            ...screenList
          ].asMap().entries.map((entry) {
            if (entry.value["isLabel"] == true) {
              return Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  entry.value["title"].toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              );
            }

            if (entry.value["isWidget"] == true) {
              return GestureDetector(
                onTap: entry.value["fn"] as Function(),
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    entry.value["className"].toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              );
            } else {
              return GestureDetector(
                onTap: entry.value["fn"] as Function(),
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    entry.value["className"].toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              );
            }
          }).toList(),
        ),
      ),
    );
  }
}
