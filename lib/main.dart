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

  List<Map<String, double>> locationList = [];

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
                    var location = Location();
                    var currentLocation = await location.getLocation();

                    var locationText =
                        '${currentLocation['latitude']}, ${currentLocation['longitude']}';

                    print(locationText);
                    setState(() {
                      _currentLocationText = locationText;
                    });
                  },
                ),
                RaisedButton(
                  child: Text('ขอพิกัดต่อเนื่อง'),
                  onPressed: () async {},
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: locationList.length,
                itemBuilder: (BuildContext context, int index) {
                  var location = locationList[index];
                  var locationText = '${location['latitude']}, ${location['longitude']}';

                  return ListTile(title: Text(locationText),);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
