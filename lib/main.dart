import 'package:flutter/material.dart';
import 'package:flutter_pokeapi/data_service.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _dataService = DataService();

  String _response = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Builder(builder: (_) {
        if (_response != '') {
          return Text(_response);
        } else {
          return ElevatedButton(
            child: Text('Make Request'),
            onPressed: _makeRequest,
          );
        }
      }),
    ));
  }

  void _makeRequest() async {
    final response = await _dataService.makeRequestToApi();
    setState(() => _response = response);
  }
}
