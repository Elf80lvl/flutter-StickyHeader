import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

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
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sticky Headers'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => StickyHeaderBuilder(
          overlapHeaders: true,
          builder: (context, stuckAmount) {
            stuckAmount = 1 - stuckAmount.clamp(0, 1);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Header $index',
                style: TextStyle(
                    //color: Colors.white,
                    color: Colors.white.withOpacity(0.5 + stuckAmount * 0.5),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            );
          },
          content: Image.network(
            'https://source.unsplash.com/random?sig=$index',
            //color: Colors.black.withOpacity(0.5),
            //height: 300,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        itemCount: 50,
      ),
    );
  }
}
