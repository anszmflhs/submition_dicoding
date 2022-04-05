import 'package:flutter/material.dart';
import 'package:submition_flutter/mainscreen.dart';

void main() {
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Cake Recipes',
       theme: ThemeData.light(),
       debugShowCheckedModeBanner: false,
       home: MainScreen(),
     );
   }
 }
 