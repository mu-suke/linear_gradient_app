import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  double _value = 0.0;
  double _startValue = 0.0;
  double _endValue = 0.0;

  void _changeSlider(double e) => setState(() {
        _value = e;
      });

  void _startSlider(double e) => setState(() {
        _startValue = e;
      });

  void _endSlider(double e) => setState(() {
        _endValue = e;
      });

  @override
  Widget build(BuildContext context) {
    final _linearGradient = LinearGradient(
        colors: [Color(0xfffc00ff), Color(0xff00dbde)], stops: [0.0, _value]);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: _linearGradient),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Stops: $_value',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Slider(
                  label: '$_value',
                  min: 0,
                  max: 1,
                  value: _value,
                  activeColor: Color(0xff00dbde),
                  inactiveColor: Color(0xfffc00ff),
                  divisions: 10,
                  onChanged: _changeSlider,
                  onChangeStart: _startSlider,
                  onChangeEnd: _endSlider,
                )
              ]),
        ),
      ),
    );
  }
}
