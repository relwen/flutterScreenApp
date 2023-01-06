import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ECMyHomePage(),
    );
  }
}

class ECMyHomePage extends StatefulWidget {
  @override
  _ECMyHomePageState createState() => _ECMyHomePageState();
}

class _ECMyHomePageState extends State<ECMyHomePage> {
  int x = 60;
  List<Widget> a = [
    Container(
      height: 200,
      child: Text('Test'),
    )
  ];

  void _d() {
    setState(
      () {
        a.add(
          Container(
            height: 200,
            child: Text('Test'),
          ),
        );
      },
    );
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextButton(
            onPressed: () {
              _d();
            },
            child: Text('Press here to add item'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: a.length,
              itemBuilder: (context, index) {
                return a[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
