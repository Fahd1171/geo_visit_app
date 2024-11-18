import 'package:flutter/material.dart';

void main() {
  runApp(GeoVisitApp());
}

class GeoVisitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoVisit App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlacesListPage(),
    );
  }
}

class PlacesListPage extends StatefulWidget {
  @override
  _PlacesListPageState createState() => _PlacesListPageState();
}

class _PlacesListPageState extends State<PlacesListPage> {
  List<String> placesToVisit = ['Place 1', 'Place 2', 'Place 3'];
  List<String> visitedPlaces = [];

  void markAsVisited(String place) {
    setState(() {
      placesToVisit.remove(place);
      visitedPlaces.add(place);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeoVisit App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: placesToVisit.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(placesToVisit[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      markAsVisited(placesToVisit[index]);
                    },
                  ),
                );
              },
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: visitedPlaces.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(visitedPlaces[index]),
                  leading: Icon(Icons.done, color: Colors.green),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
