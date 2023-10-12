import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String location;
  final String fatherOrHusbandName;
  final String gasType;

  SearchScreen({
    required this.name,
    required this.phoneNumber,
    required this.location,
    required this.fatherOrHusbandName,
    required this.gasType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.yellow], // Adjust colors as needed
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('Name'),
                        subtitle: Text('Your name'),
                      ),
                      ListTile(
                        title: Text('Phone number'),
                        subtitle: Text('Your phone number'),
                      ),
                      ListTile(
                        title: Text('Location'),
                        subtitle: Text('Your location'),
                      ),
                      ListTile(
                        title: Text("Father's/Husband's name"),
                        subtitle: Text('Name'),
                      ),
                      ListTile(
                        title: Text('Gas Type'),
                        subtitle: Text('Gas type'),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Go back to the HomePage
                },
                child: Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

