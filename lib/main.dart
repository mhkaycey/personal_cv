import 'package:cv/Data/mycv_data.dart';
import 'package:cv/screens/home/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final myData = MyData();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:
            const TextTheme(bodyMedium: TextStyle(color: Colors.black)).apply(),
        scaffoldBackgroundColor: Colors.orange,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
      ),
      home: HomePage(myData: myData),
    );
  }
}
