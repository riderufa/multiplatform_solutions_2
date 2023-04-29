import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'mock_web_view.dart'
    if (dart.library.io) 'non_web_platform_web_view.dart'
    if (dart.library.html) 'web_platform_web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
        link: 'https://flutter.dev',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.link});

  final String title;
  final String link;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _cors = '';

  Future<void> getCORS() async {
    var response = await http.get(
      Uri.parse(widget.link),
      headers: {"Access-Control-Allow-Origin": "*"},
    );
    setState(() {
      _cors = response.headers['access-control-allow-origin'] ?? 'none';
    });
  }

  @override
  void initState() {
    getCORS();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(kIsWeb ? 'web' : Platform.operatingSystem),
            Text('CORS header: $_cors'),
          ],
        ),
      ),
      body: webView(widget.link),
    );
  }
}
