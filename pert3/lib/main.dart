import 'package:flutter/material.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PortfolioPage(),
      debugShowCheckedModeBanner: false, // Set this to false to hide the Debug banner
    );
  }
}

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [AboutMePage(), ProjectsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio'),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About Me',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Projects',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class JustifiedText extends StatelessWidget {
  final String text;
  final TextStyle style;

  JustifiedText({required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5, // You can adjust the elevation (shadow) of the card
        child: Container(
          width: 300, // Adjust the width to your preference
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network(
                'https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg',
                width: 100,
              ),
              SizedBox(height: 10), // Add spacing
              Text(
                'Jefry Sunupurwa Asri',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10), // Add spacing
              JustifiedText(
                text:
                '8126',
                style: TextStyle(fontSize: 16),
              ),
              JustifiedText(
                text:
                'Mata Kuliah Pemrograman Mobile',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create a list of project data, such as titles and descriptions
    List<Map<String, String>> projects = [
      {
        'title': 'Project 1',
        'description': 'This is the description of Project 1.',
      },
      {
        'title': 'Project 2',
        'description': 'This is the description of Project 2.',
      },
      // Add more projects here
    ];

    return Center(
      child: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5, // Adjust the elevation (shadow) of the card
            margin: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    projects[index]['title']!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10), // Add spacing
                  Text(
                    projects[index]['description']!,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

