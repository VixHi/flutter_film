import 'package:flutter/material.dart';
import 'package:flutter_film/view/dy_film_drawer.dart';
import 'package:flutter_film/view/dy_movie_list.dart';
import 'package:flutter_film/view/dy_movie_list2.dart';
import 'package:flutter_film/view/dy_setting_detail.dart';

class DYMainViewConfig extends StatefulWidget {
  @override
  _DYMainViewConfigState createState() => _DYMainViewConfigState();
}

class _DYMainViewConfigState extends State<DYMainViewConfig> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = [
    // Text("1"),
    // Text("2"),
    // Text("3"),
    DYMovieList(type: "in_theaters"),
    // DYSettingDetail(),
    DYMovieList(type: "coming_soon"),
    DYMovieList2(type: "top250"),
    // new

  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("电影列表"),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
        ),
        drawer: Drawer(
          child: DYFilmDrawer(),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (currentIndex) {
            print("当前index: $currentIndex");
            setState(() {
              _selectedIndex = currentIndex;
            });
            print("赋值后：$_selectedIndex");

            // if (currentIndex != _selectedIndex) {
            //
            // }
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter), label: "正在热映"),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation), label: "即将上映"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_movies), label: "Top100"),
          ],
        ),
      ),
    );
  }
}
