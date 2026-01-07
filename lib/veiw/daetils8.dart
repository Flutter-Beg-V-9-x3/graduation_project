
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nolan Scene',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SceneScreen(),
    );
  }
}

class SceneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Christopher Nolan Scene'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
            ),
            SizedBox(height: 20),
            Text(
              'The docking scene is perhaps the most tense sequence in cinema history.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
        
        ),
      ),
    
  }
}


