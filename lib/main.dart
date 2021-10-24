import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

 
 class MyHomePage extends StatelessWidget {
   
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Sankalpa")),
         body: TextInputWidget()
     );
    
   }
 }

 class TextInputWidget extends StatefulWidget {
   
   @override
   _TextInputWidgetState createState() => _TextInputWidgetState();
 }
 
 class _TextInputWidgetState extends State<TextInputWidget> {
   @override
   Widget build(BuildContext context) {
     return TextField(
       decoration: InputDecoration(
         prefixIcon: Icon(Icons.message),
         labelText: "Type a message"),
       );
   }
 }