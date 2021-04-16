import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_film/model/dy_film_list_model.dart';
import 'package:flutter_film/view/dy_film_detail.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

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


  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //       itemCount: films.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         Subjects item = films[index];
  //         return GestureDetector(
  //           onTap: (){
  //             Navigator.of(context).push(
  //               MaterialPageRoute(builder: (BuildContext context) => DYFilmDetail(item.title, item.id)),
  //             );
  //           },
  //           child: Container(
  //             padding: EdgeInsets.all(10),
  //             child: Row(
  //               children: [
  //                 Container(
  //                   // child: Image(image: NetworkImage(item.images.small ?? "assets/images/4.png") , fit: BoxFit.cover,width: 130, height: 180)
  //                   child: CachedNetworkImage(
  //                     // colorBlendMode: BlendMode.hardLight,
  //                     fit: BoxFit.cover,
  //                     width: 130,
  //                     height: 180,
  //                     imageUrl: item.images.small,
  //                     placeholder: (context, url) => CircularProgressIndicator(),
  //                     errorWidget: (context, url, error) => Image.asset("assets/images/4.png"),
  //                   )
  //                 ),
  //                 Column(
  //                   children: [
  //                     Container(
  //                       padding: EdgeInsets.only(left: 10),
  //                       // alignment: AlignmentGeometry.par(),
  //                       height: 120,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         // verticalDirection: VerticalDirection.down,
  //                         //   mainAxisSize: MainAxisSize.max,
  //                         children: [
  //                           Text("电影名称：${item.title}", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 16)),
  //                           Text("上映年份：${item.year}年", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 14)),
  //                           Text("电影类型：${item.genres.join("，")}", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 14)),
  //                           Text("豆瓣评分：${item.rating.average}分", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 14)),
  //                           // Text(item.title, textDirection: TextDirection.ltr, style: TextStyle(fontSize: 20)),
  //                         ],
  //                       ),
  //                     ),
  //
  //                     Container(
  //                       padding: EdgeInsets.only(left: 10),
  //                       height: 60,
  //                       child: Row(
  //                         // crossAxisAlignment: CrossAxisAlignment.start,
  //                         // mainAxisAlignment: MainAxisAlignment.start,
  //                         children: [
  //                           Text("主要演员:"),
  //                           Row(
  //                             children: [
  //                               CircleAvatar(backgroundImage: NetworkImage(item.casts[0].avatars.small)),
  //                               CircleAvatar(backgroundImage: NetworkImage(item.casts[1].avatars.small)),
  //                               CircleAvatar(backgroundImage: NetworkImage(item.casts[2].avatars.small))
  //                             ],
  //                             // children: (index){},
  //                           )
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 Divider(height: 1, color: Colors.black)
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }



  List<Subjects> films = [];
  int page = 1;
  int size = 10;

  @override
  void initState() {
    super.initState();
    getMovieList();
    print("电影类型：${widget.type}");
  }

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    print("^^^^^^^^ $page");
    setState(() {
      page = 1;
      films.removeRange(0, films.length);
    });
    getMovieList();
    _refreshController.refreshCompleted();
  }

  void _onLoading() {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());

    // setState(() {
    //   page++;
    // });
    // print("******** $page");

    if(mounted)
      setState(() {
        page++;
        print("******** $page");
      });
    getMovieList();
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context,LoadStatus mode){
          Widget body ;
          if(mode==LoadStatus.idle){
            body =  Text("上拉加载");
            print("上拉加载");
          }
          else if(mode==LoadStatus.loading){
            body =  CupertinoActivityIndicator();
            print("CupertinoActivityIndicator()");
          }
          else if(mode == LoadStatus.failed){
            body = Text("加载失败！点击重试！");
            print("加载失败！点击重试！");
          }
          else if(mode == LoadStatus.canLoading){
            body = Text("松手,加载更多!");
            print("松手,加载更多!");
          }
          else{
            body = Text("没有更多数据了!");
            print("没有更多数据了!");
          }
          return Container(
            height: 55.0,
            child: Center(child:body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,

      child: ListView.builder(
          itemCount: films.length,
          itemBuilder: (BuildContext context, int index) {
            Subjects item = films[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          DYFilmDetail(item.title, item.id)),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                        // child: Image(image: NetworkImage(item.images.small ?? "assets/images/4.png") , fit: BoxFit.cover,width: 130, height: 180)
                        child: CachedNetworkImage(
                      // colorBlendMode: BlendMode.hardLight,
                      fit: BoxFit.cover,
                      width: 130,
                      height: 180,
                      imageUrl: item.images.small,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/4.png"),
                    )),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          // alignment: AlignmentGeometry.par(),
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // verticalDirection: VerticalDirection.down,
                            //   mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("电影名称：${item.title}",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(fontSize: 16)),
                              Text("上映年份：${item.year}年",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(fontSize: 14)),
                              Text("电影类型：${item.genres.join("，")}",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(fontSize: 14)),
                              Text("豆瓣评分：${item.rating.average}分",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(fontSize: 14)),
                              // Text(item.title, textDirection: TextDirection.ltr, style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 60,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("主要演员:"),
                              Row(
                                children: [
                                  CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          item.casts[0].avatars.small)),
                                  CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          item.casts[1].avatars.small)),
                                  CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          item.casts[2].avatars.small))
                                ],
                                // children: (index){},
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(height: 1, color: Colors.black)
                  ],
                ),
              ),
            );
          }),
    );
  }

  getMovieList() async {
    print("电影类型：${widget.type}");
    // switch (widget.type) {
    //   case "in_theaters":
    //     break;
    //   case "coming_soon":
    //     break;
    //   case "top_250":
    //     break;
    //   default:
    // }
    int offset = (page - 1) * size;

    // var url = Uri.parse(urlStr);
    // Response response = await http.get(url);

    try {
      var urlStr =
          "http://www.liulongbin.top:3005/api/v2/movie/${widget.type}?start=${offset}&count=${size}";
      print("偏移量：$offset");
      var response = await Dio().get(urlStr);
      var result = response.data;
      setState(() {
        for (var film in result["subjects"]) {
          films.add(Subjects.fromMap(film));
        }
      });
      print("数据长度:${result["subjects"].length}, 数据总数：${films.length}");

    } catch (e) {
      print(e);
    }
  }
}
