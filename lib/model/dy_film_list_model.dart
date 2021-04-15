import 'package:flutter/material.dart';


class DYFilmListModel {
  var count;
  var start;
  var total;
  Subjects subjects;
  var title;

  DYFilmListModel.fromMap(Map<String, dynamic>json):
    this.count    = json["count"],
    this.start    = json["start"],
    this.total    = json["total"],
    this.title    = json["total"],
    this.subjects = Subjects.fromMap(json["subjects"]);

}

class Subjects {
  Rating rating;
  List<dynamic> genres;
  String title;
  int collect_count;
  String original_title;
  String subtype;
  String year;
  String alt;
  String id;
  Images images;
  List<Casts> casts;
  List<Directors> directors;
  Subjects.fromMap(Map<String, dynamic>json):
    this.title    = json["title"],
    this.collect_count = json["collect_count"],
    this.original_title   = json["original_title"],
    this.subtype          = json["subtype"],
    this.year             = json["year"],
    this.alt              = json["alt"],
    this.id               = json["id"],
    this.rating           = Rating.fromMap(json["rating"]),
    this.images           = Images.formMap(json["images"]),
    this.genres           = (json["genres"] as List<dynamic>).map((e) => e).toList(),
    this.casts            = (json["casts"] as List<dynamic>).map((e) => Casts.fromMap(e)).toList(),
    this.directors        = (json["directors"] as List<dynamic>).map((e) => Directors.fromMap(e)).toList();
}

class Rating {
  int max;
  double average;
  String stars;
  int min;
  Rating.fromMap(Map<String, dynamic>json):
    this.max      = json["max"],
    this.average  = json["average"],
    this.stars    = json["stars"],
    this.min      = json["min"];
}


class Casts {
  String alt;
  String name;
  String id;
  Avatars avatars;
  Casts.fromMap(Map<String, dynamic>json):
    this.alt      = json["alt"],
    this.name     = json["name"],
    this.id       = json["id"],
    this.avatars  = Avatars.formMap(json["avatars"]);

}

class Avatars {
  String small;
  String large;
  String medium;
  Avatars.formMap(Map<String, dynamic>json):
    this.small    = json["small"],
    this.large    = json["large"],
    this.medium   = json["medium"];
}

class Directors {
  String alt;
  Avatars avatars;
  String name;
  String id;
  Directors.fromMap(Map<String, dynamic> json):
    this.alt      = json["alt"],
    this.name     = json["name"],
    this.id       = json["id"],
    this.avatars  = Avatars.formMap(json["avatars"]);
}

class Images {
  String small;
  String large;
  String medium;
  Images.formMap(Map<String, dynamic>json):
    this.small    = json["small"],
    this.large    = json["large"],
    this.medium   = json["medium"];
}



/*

{
"count":1,
"start":1,
"total":250,
"subjects":[
{
"rating":{
"max":10,
"average":9.5,
"stars":"50",
"min":0
},
"genres":[
"剧情",
"爱情",
"同性"
],
"title":"霸王别姬",
"casts":[
{
"alt":"https://movie.douban.com/celebrity/1003494/",
"avatars":{
"small":"https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p67.webp",
"large":"https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p67.webp",
"medium":"https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p67.webp"
},
"name":"张国荣",
"id":"1003494"
},
{
"alt":"https://movie.douban.com/celebrity/1050265/",
"avatars":{
"small":"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p46345.webp",
"large":"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p46345.webp",
"medium":"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p46345.webp"
},
"name":"张丰毅",
"id":"1050265"
},
{
"alt":"https://movie.douban.com/celebrity/1035641/",
"avatars":{
"small":"https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1399268395.47.webp",
"large":"https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1399268395.47.webp",
"medium":"https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1399268395.47.webp"
},
"name":"巩俐",
"id":"1035641"
}
],
"collect_count":898862,
"original_title":"霸王别姬",
"subtype":"movie",
"directors":[
{
"alt":"https://movie.douban.com/celebrity/1023040/",
"avatars":{
"small":"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1451727734.81.webp",
"large":"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1451727734.81.webp",
"medium":"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1451727734.81.webp"
},
"name":"陈凯歌",
"id":"1023040"
}
],
"year":"1993",
"images":{
"small":"https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1910813120.webp",
"large":"https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1910813120.webp",
"medium":"https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1910813120.webp"
},
"alt":"https://movie.douban.com/subject/1291546/",
"id":"1291546"
}
],
"title":"豆瓣电影Top250"
}

*/