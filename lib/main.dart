import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'new_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation Drawer",
      theme: ThemeData(
        primarySwatch: Colors.brown,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[50]:null
      ),
      home: HomePage(),
      routes: <String,WidgetBuilder>{
        "/a":(BuildContext context) => new NewPage("New Page Hime"),
      }
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("HunglD"),
              accountEmail: Text("Hungldgch16040@fpt.edu.vn"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Theme.of(context).platform == TargetPlatform.iOS ? Colors.deepPurple:Colors.white,
                child: Text("H"),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("LD"),
                )
              ],
            ),
            ListTile(
              title: Text("Page One"),
              trailing: Icon(Icons.arrow_upward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/a");},
            ),
               ListTile(
              title: Text("Page Two"),
              trailing: Icon(Icons.arrow_downward),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
             ListTile(
              title: Text("Page Three"),
              trailing: Icon(Icons.skip_next),
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context)=> new NewPage("Page Three"))
                ),
            ),
             ListTile(
              title: Text("Page Four"),
              trailing: Icon(Icons.skip_next),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context)=> new NewPage("Page Three"))
                );
              }
            ),
               ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
              
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}