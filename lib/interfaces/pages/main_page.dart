import 'package:droptune/interfaces/pages/music_page.dart';
import 'package:droptune/interfaces/pages/playlist_page.dart';
import 'package:droptune/interfaces/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController _pageController;
  bool overlayVisibility = true;

  List<BottomNavigationBarItem> _navigationBarItems = [
    BottomNavigationBarItem(title: Text("Music"), icon: Icon(Icons.music_note)),
    BottomNavigationBarItem(title: Text("Playlist"), icon: Icon(Icons.list)),
    BottomNavigationBarItem(title: Text("Profile"), icon: Icon(Icons.person))
  ];

  List<Widget> _pages = [MusicPage(), PlaylistPage(), ProfilePage()];

  void _hideOverlay() {
    overlayVisibility = false;
  }

  void _showOverlay() {
    overlayVisibility = true;
  }

  Widget _buildNavigationBar() {
    return Stack(
      overflow: Overflow.visible,
      alignment: new FractionalOffset(0, 0.0),
      children: <Widget>[
        Visibility(
          child: Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 60,
            height: 50,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AC/DC ",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "• The Razor's Edge",
                          style: TextStyle(color: Colors.grey[400]),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    child: Icon(
                      Icons.pause,
                    ),
                    padding: EdgeInsets.only(right: 20),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Color(0xfff4f8f9)),
              //decoration: BoxDecoration(color: Colors.red),
            ),
          ),
          visible: overlayVisibility,
        ),
        BottomNavigationBar(
            onTap: (currentIndex) {
              _pageController.animateToPage(currentIndex,
                  duration: Duration(microseconds: 500),
                  curve: Curves.decelerate);
            },
            currentIndex: _currentIndex,
            items: _navigationBarItems)
      ],
    );
  }

  PageView _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (newIndex) {
        setState(() {
          _currentIndex = newIndex;
          if (newIndex == 2)
            _hideOverlay();
          else
            _showOverlay();
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
        title: Text("Droptune"),
        centerTitle: true,
      ),
      body: _buildPageView(),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }
}
