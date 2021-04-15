import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_film/view/dy_film_detail.dart';
import 'package:http/http.dart' as http;

Dio dio = Dio();

class DYMovieList2 extends StatefulWidget {
  DYMovieList2({Key key, @required this.type}) : super(key: key);
  final String type;

  @override
  _DYMovieList2State createState() {
    return new _DYMovieList2State();
  }
}

class _DYMovieList2State extends State<DYMovieList2> {
  int page = 1;
  int size = 10;
  var mlist = [];
  var total = 0;

  @override
  void initState() {
    super.initState();
    getMovieList();
    print("电影类型：${widget.type}");

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mlist.length,
        itemBuilder: (BuildContext context, int index) {
          var item = mlist[index];
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => DYFilmDetail(item["title"], item["id"])),
              );
            },
            child: Container(
                padding: EdgeInsets.all(50), child: Text(item["title"])),
          );
        });
  }

  getMovieList() async {
    // print("电影类型：${widget.type}");
    switch (widget.type) {
      case "in_theaters":
        page = 1;
        break;
      case "coming_soon":
        page = 2;
        break;
      case "top_250":
        page = 3;
        break;
      default:
    }
    int offset = (page - 1) * size;

    // var url = Uri.parse(urlStr);
    // Response response = await http.get(url);

    try {
      var urlStr =
          "http://www.liulongbin.top:3005/api/v2/movie/${widget.type}?start=${offset}&count=${size}";
      var response = await Dio().get(urlStr);
      var result = response.data;
      print(result);
      setState(() {
        mlist = result["subjects"];
        total = result["total"];
      });
    } catch (e) {
      print(e);
    }
  }
}

class DYMovieItem {}
