import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_film/model/dy_film_list_model.dart';
import 'package:flutter_film/view/dy_film_detail.dart';
import 'package:http/http.dart' as http;

Dio dio = Dio();

class DYMovieList extends StatefulWidget {
  DYMovieList({Key key, @required this.type}) : super(key: key);
  final String type;

  @override
  _DYMovieListState createState() {
    
    return new _DYMovieListState();
  }
}

class _DYMovieListState extends State<DYMovieList> {

  List films = [];
  int page = 1;
  int size = 1;
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
                MaterialPageRoute(builder: (BuildContext context) => DYFilmDetail(item["casts"], item["id"])),
              );
            },
            child: Container(
              height: 180,
              width: 130,
              padding: EdgeInsets.all(10), 
              child: Row(
                children: [
                  Container(
                    child: Image(image: NetworkImage(item["images"]["small"]), fit: BoxFit.cover)
                  ),
                ],
              ),
            ),
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
      for (var film in result["subjects"]) {
        print(film);
        films.add(Subjects.fromMap(film));
      }
      print("数组长度: ${films.length}");
      for (Subjects item in films) {

        print("${item.title}, ${item.id}, ${item.images.medium}, ${item.casts[0].avatars.small}, ${item.directors[0].avatars.small}");
      }
      // print();
      // setState(() {
      //   mlist = result["subjects"];
      //   total = result["total"];
      // });
    } catch (e) {
      print(e);
    }
  }
}


class DYImagePicker extends StatefulWidget {
  @override
  _DYImagePickerState createState() => _DYImagePickerState();
}

class _DYImagePickerState extends State<DYImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}





