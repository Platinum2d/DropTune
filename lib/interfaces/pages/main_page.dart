import 'package:droptune/interfaces/pages/music_page.dart';
import 'package:droptune/interfaces/pages/playlist_page.dart';
import 'package:droptune/interfaces/pages/profile_page.dart';
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
    MusicPage(),
    PlaylistPage(),
    ProfilePage()
  ];

  BottomNavigationBar _buildNavigationBar(){
    return BottomNavigationBar(
        onTap: (currentIndex) {
          _pageController.animateToPage(currentIndex,
              duration: Duration(microseconds: 500), curve: Curves.easeInSine);
        },
        currentIndex: _currentIndex,
        items: _navigationBarItems);
  }

  PageView _buildPageView(){
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (newIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      },
      children: _pages,
    );
  }

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
        centerTitle: true,
        title: Text("Droptune", style: TextStyle(fontWeight: FontWeight.w500),),
      ),
      body: _buildPageView(),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }
}
