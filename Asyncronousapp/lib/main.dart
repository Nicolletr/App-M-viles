import 'package:flutter/material.dart';

import 'services/mockapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Async App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 193, 81, 81),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff800000),
          secondary: const Color(0xffb71c1c),
        ),
      ),
      home: const AsyncApliccation(title: 'Async Aplicación'),
    );
  }
}

class AsyncApliccation extends StatefulWidget {
  const AsyncApliccation({super.key, required this.title});

  final String title;

  @override
  State<AsyncApliccation> createState() => _AsyncApliccationState();
}

class _AsyncApliccationState extends State<AsyncApliccation> {
  //DECLARACIONES DE VARIABLES
  int rayo = 0;
  int r_lapsed_time = 0;
  double rayo_bar_with = 0;
  int rayo_text = 0;

  int bus = 0;
  int b_lapsed_time = 0;
  double bus_bar_with = 0;
  int bus_text = 0;

  int human = 0;
  int h_lapsed_time = 0;
  double human_bar_with = 0;
  int human_text = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the AsyncApliccation object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.green,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.flash_on,
                  color: Colors.white,
                ),
                iconSize: 50.0,
                onPressed: () async {
                  setState(() {
                    rayo_bar_with = 300;
                    r_lapsed_time = 1;
                  });
                  rayo = await MockApi().getFerrariInteger();
                  setState(() {
                    rayo_text = rayo;
                    r_lapsed_time = 0;
                    rayo_bar_with = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                  width: rayo_bar_with,
                  height: 15,
                  decoration: const BoxDecoration(color: Colors.green),
                  duration: Duration(seconds: r_lapsed_time)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                rayo.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.orange,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.airport_shuttle,
                  color: Colors.white,
                ),
                iconSize: 50.0,
                onPressed: () async {
                  setState(() {
                    bus_bar_with = 300;
                    b_lapsed_time = 3;
                  });
                  bus = await MockApi().getHyundaiInteger();
                  setState(() {
                    bus_text = bus;
                    b_lapsed_time = 0;
                    bus_bar_with = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                  width: bus_bar_with,
                  height: 15,
                  decoration: const BoxDecoration(color: Colors.orange),
                  duration: Duration(seconds: b_lapsed_time)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                bus.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.red,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.directions_walk,
                  color: Colors.white,
                ),
                iconSize: 50.0,
                onPressed: () async {
                  setState(() {
                    human_bar_with = 300;
                    h_lapsed_time = 10;
                  });
                  human = await MockApi().getFisherPriceInteger();
                  setState(() {
                    human_text = human;
                    h_lapsed_time = 0;
                    human_bar_with = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                  width: human_bar_with,
                  height: 15,
                  decoration: const BoxDecoration(color: Colors.red),
                  duration: Duration(seconds: h_lapsed_time)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                human.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
