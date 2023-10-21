import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 2',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  String _currentMenu = 'Home';
  void _changeSelectedNavBar(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        _currentMenu = 'Home';
      }else if(index == 1){
        _currentMenu = 'Profile';
      }else if(index == 2){
        _currentMenu = 'Inbox';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
        backgroundColor: Colors.pink,
          centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello World!",
            ),
            const SizedBox(height: 5,),
            Text(
              "Index: $_currentIndex",
            ),
            const SizedBox(height: 5,),
            Text(
              "Nama Menu: $_currentMenu",
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail_sharp),
              label: 'Profile'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Inbox'
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        onTap: _changeSelectedNavBar,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}