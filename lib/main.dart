import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'newpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Menu Drawer",
      theme: ThemeData(
          primarySwatch: Colors.lime,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.white
              : null),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => NewPage("Page")
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Side Menu"),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Ashish Sah"),
              accountEmail: Text("ashishsah173"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.deepPurpleAccent
                        : Colors.brown,
                child: Text("A"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.greenAccent
                          : Colors.blue,
                  child: Text("S"),
                )
              ],
            ),
            ListTile(
              title: Text("Content 1"),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/a");
              },
            ),
            ListTile(
              title: Text("Content 2"),
              trailing: Icon(Icons.arrow_downward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NewPage("Content 2")));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Content 3"),
              trailing: Icon(Icons.arrow_left),
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
