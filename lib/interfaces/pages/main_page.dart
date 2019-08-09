import 'package:droptune/interfaces/pages/overlay_bar.dart';
import 'package:droptune/interfaces/pages/sections/music_page.dart';
import 'package:droptune/interfaces/pages/sections/playlist_page.dart';
import 'package:droptune/interfaces/pages/sections/profile/profile_page.dart';
import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:droptune/misc/utils/playlist_utils.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  final DroptunePlayer player = DroptunePlayer(
      queueTracks: GetItReference.getIt.get<List<Track>>(),
      reproducingPlaylist: PlaylistUtils.getMainPlaylistSignature());

  @override
  State createState() {
    /* queue restore! */
    GetItReference.getIt.registerSingleton<DroptunePlayer>(player);
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1;
  PageController _pageController;
  bool overlayVisibility = true;
  List<Widget> _appBarActions = [];

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

  void _hideSettingsAction() {
    _appBarActions.removeWhere((Widget widget) {
      ValueKey<String> key = widget.key;
      return identical(key.value, 'settings');
    });
  }

  void _showSettingsAction() {
    _appBarActions.add(IconButton(
        key: Key("settings"),
        color: Colors.grey,
        icon: Icon(Icons.settings),
        onPressed: () {}));
  }

  Widget _buildNavigationBar(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Routing.goToPlayingPage(context,
                clearStack: false); /* the current playlist MUST be passed! */
          },
          child: Visibility(
            child: ChangeNotifierProvider(
              builder: (context) => widget.player,
              child: OverlayBarWidget(),
            ),
            visible: overlayVisibility,
            maintainState: true,
          ),
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
          if (newIndex == 2) {
            _hideOverlay();
            _showSettingsAction();
          } else {
            _hideSettingsAction();
            _showOverlay();
          }
        });
      },
      children: _pages,
    );
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 1);
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
        actions: _appBarActions,
        title: Text("Droptune"),
        centerTitle: true,
      ),
      body: _buildPageView(),
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }
}
