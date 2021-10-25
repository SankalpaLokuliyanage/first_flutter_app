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

 
class MyHomePage extends StatefulWidget {
   @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String text = "";

  void changeText(String text) {
    this.setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Sankalpa")),
         body: Column(
           children: [TextInputWidget(this.changeText), Text(text)],
         )
     );
  }
}

 class TextInputWidget extends StatefulWidget {

   final Function(String) callback;
  
   TextInputWidget(this.callback);

   
   @override
   _TextInputWidgetState createState() => _TextInputWidgetState();
 }
 
 class _TextInputWidgetState extends State<TextInputWidget> {

   final controller = TextEditingController();
   String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
   }

  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

   @override
   Widget build(BuildContext context) {
     return Column(
       children: <Widget>[
         TextField(
           controller: this.controller,
           decoration: InputDecoration(
             prefixIcon: Icon(Icons.message),
             labelText: "Type a message",
             suffixIcon: IconButton(
               icon: Icon(Icons.send),
               tooltip: "Post Message",
               splashColor: Colors.redAccent,
               onPressed: this.click,)),
           ),
           Text(text),
       ],
     );
   }
 }