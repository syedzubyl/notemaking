import 'package:flutter/material.dart';
import 'main.dart';

class secondfun extends StatelessWidget {
  const secondfun({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('This is the second screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:  (context)=> const MyApp()));
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}