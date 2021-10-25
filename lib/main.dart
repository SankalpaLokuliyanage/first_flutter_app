import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    this.userLiked = !this.userLiked;
    if(this.userLiked) {
      this.likes += 1;
    } else {
      this.likes -= 1;
    }
  }
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

  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, "sankalpa"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Sankalpa")),
         body: Column(
           children: [
             Expanded(child: PostList(this.posts)),
             Expanded(child: TextInputWidget(this.newPost)),
             ],
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

 class PostList extends StatefulWidget {
 
final List<Post> listItems;

PostList(this.listItems);

   @override
   _PostListState createState() => _PostListState();
 }
 
 class _PostListState extends State<PostList> {

   void like(Function callback) {
     this.setState(() {
       callback();
     });
   }

   @override
   Widget build(BuildContext context) {
     return ListView.builder(
       itemCount: this.widget.listItems.length,
       itemBuilder: (context, index) {
         var post = this.widget.listItems[index];
         return Card(
           child: Row(children: [
             Expanded(child: ListTile(title: Text(post.body), subtitle: Text(post.author),)),
             Row(children: [
              Container(
                child: Text(
                  post.likes.toString(),style: TextStyle(fontSize: 20),
                ), 
                padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
              ),

               IconButton(
                 icon: Icon(Icons.thumb_up),
                 onPressed: () => this.like(post.likePost),
               )
             ],)
           ],),
         );
       },
     );
   }
 }