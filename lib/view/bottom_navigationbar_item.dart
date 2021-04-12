import 'package:flutter/material.dart';

class DYBottomNavigationBarItem extends StatefulWidget {
  final int _selectedIndex;
  DYBottomNavigationBarItem(this._selectedIndex);

  @override
  _DYBottomNavigationBarItemState createState() =>
      _DYBottomNavigationBarItemState(_selectedIndex);
}

class _DYBottomNavigationBarItemState extends State<DYBottomNavigationBarItem> {
  int _selectedIndex = 0;
  _DYBottomNavigationBarItemState(this._selectedIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (int currentIndex) {
        setState(() {
          _selectedIndex = currentIndex;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.movie_filter), label: "正在热映"),
        BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation), label: "即将上映"),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_movies), label: "Top100"),
      ],
    );
  }
}


class DYWidgetOptions extends StatefulWidget {
  final int selectIndex;
  DYWidgetOptions(this.selectIndex);
  @override
  _DYWidgetOptionsState createState() => _DYWidgetOptionsState(selectIndex);
}

class _DYWidgetOptionsState extends State<DYWidgetOptions> {
  int selectIndex;
  _DYWidgetOptionsState(this.selectIndex);

  static const List<Widget> _widgetOptions = [
    Text("1"),
    Text("2"),
    Text("3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _widgetOptions[selectIndex],
    );
  }
}


class DYChildOption extends InheritedWidget {
  DYChildOption({Key key, this.child}) : super(key: key, child: child);

  final Widget child;

  static DYChildOption of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DYChildOption>();
  }

  @override
  bool updateShouldNotify(DYChildOption oldWidget) {
    return true;
  }
}

// class DYOption extends InheritedWidget {

// }