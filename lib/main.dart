import 'package:flutter/material.dart';
import 'dart:async';

import 'adddatawidget.dart';
import 'tenislist.dart';
import 'models/tenis.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NINETY',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'NINETY'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService api = ApiService();
  List<Tenis> tenisList = [];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: _getData,
        child: Container(
          child: Center(
              child: FutureBuilder<List<Tenis>>(
            future: loadList(),
            builder: (context, AsyncSnapshot<List<Tenis>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              print("feature builder");
              print(snapshot.connectionState);
              return tenisList.length > 0
                  ? TenisList(tenis: tenisList)
                  : Center(
                      child: Text('No data found, tap plus button to add!',
                          style: Theme.of(context).textTheme.headline6));
            },
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }

  Future<List<Tenis>> loadList() async {
    print("load list");
    Future<List<Tenis>> futureTenis = api.getTenis();
    futureTenis.then((tenisList) {
      print("setState");
      
      this.tenisList = tenisList;
      
    });
    return futureTenis;
  }

  Future<void> _getData() async {
    setState(() {
      loadList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadList();
  }

  _navigateToAddScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddDataWidget()),
    );
  }
}
