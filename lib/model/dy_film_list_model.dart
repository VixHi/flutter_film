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
    this.title            = json["title"],
    this.collect_count    = json["collect_count"],
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
