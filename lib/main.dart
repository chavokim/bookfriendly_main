import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '읽어양득'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xFFB07A4D),
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(widget.title, style: TextStyle(color: Color(0xFF6F4A32))),
        centerTitle: false,
        elevation: 0,
        shadowColor: null,
      ),
      body: Container(child: getPage()),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF6F4A32),
        unselectedItemColor: Color(0xFF222222),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "검색",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: "글쓰기",
          ),BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "소통",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: "내 책장",
          ),
        ],
        currentIndex: selectedIdx,
        onTap: (idx) => {
          setState(() => {
            selectedIdx = idx
          })
        },
      ),
    );
  }

  Widget getPage() {
    if(selectedIdx == 0) {
      return getMainPage();
    } else {
      return Container();
    }
  }

  Widget getMainPage() {
    return Container();
  }
}
