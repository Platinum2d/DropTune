import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController _pageController;

  List<BottomNavigationBarItem> _navigationBarItems = [
    BottomNavigationBarItem(title: Text("Music"), icon: Icon(Icons.music_note)),
    BottomNavigationBarItem(title: Text("Playlist"), icon: Icon(Icons.list)),
    BottomNavigationBarItem(title: Text("Profile"), icon: Icon(Icons.person))
  ];

  List<Widget> _pages = [
    Center(
      child: Text("Musica"),
    ),
    Center(
      child: Text("Playlist"),
    ),
    Center(
      child: Text("Profilo"),
    )
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Droptune"),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (currentIndex) {
            _pageController.animateToPage(currentIndex,
                duration: Duration(microseconds: 500), curve: Curves.easeInSine);
          },
          currentIndex: _currentIndex,
          items: _navigationBarItems),
    );
  }
}
