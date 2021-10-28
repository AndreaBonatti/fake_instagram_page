import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: RootPage());
  }
}

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("billgates"),
        centerTitle: true,
      ),
      body: ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.indigo),
        unselectedIconTheme: IconThemeData(color: Colors.black),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(SimpleLineIcons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Feather.search), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(SimpleLineIcons.plus), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(SimpleLineIcons.heart), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(SimpleLineIcons.user), label: "home")
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [profileHeader(), photoGrid()],
    );
  }

  Widget profileHeader() => SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage("https://cdn.talkglitz.media/wp-content/uploads/2020/07/XpgonN0X.jpg?strip=all&lossy=1&ssl=1"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "@thisisbillgates",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          MaterialButton(
                            minWidth: double.infinity,
                            height: 35,
                            color: Colors.blue.shade700,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Segui",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Bill Gates",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                  Text(
                      "Sharing thins I'm learning through my foundation work and other interests."),
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      child: Text(
                        "gatesnot.es/2020AnnualLetter",
                        style: TextStyle(color: Colors.indigo.shade900),
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.black26, width: 1))),
              child: Row(
                children: List.generate(
                    3,
                    (index) => Expanded(
                            child: Container(
                          child: Column(
                            children: [
                              Text(
                                "139",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "post",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ))),
              ),
            ),
          ],
        ),
      );

  Widget photoGrid() => SliverGrid(
      delegate: SliverChildListDelegate(List.generate(
          12,
          (index) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage("https://cdn.talkglitz.media/wp-content/uploads/2020/07/XpgonN0X.jpg?strip=all&lossy=1&ssl=1"),
                  fit: BoxFit.cover,
                )),
              ))),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ));
}
