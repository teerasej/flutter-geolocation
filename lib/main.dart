import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nextflow Geolocation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Nextflow Geolocation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentLocationText = "...";

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('$_currentLocationText'),
                RaisedButton(
                  child: Text('ขอพิกัดตอนนี้'),
                  onPressed: () async {
                    
                  },
                ),
                RaisedButton(
                  child: Text('ขอพิกัดต่อเนื่อง'),
                  onPressed: () async {
                    
                  },
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
