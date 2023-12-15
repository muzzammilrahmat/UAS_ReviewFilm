class MyUser {
  final String fullname;
  final String email;
  final String notlp;

  MyUser({
    required this.fullname,
    required this.email,
    required this.notlp,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "email": email,
      "notlp": notlp,
    };
  }

  factory MyUser.fromJson(Map<String, dynamic> json) {
    return MyUser(
      fullname: json["fullname"],
      email: json["email"],
      notlp: json["notlp"],
    );
  }
}

class DataAnime {
  String? name;
  String? genre;
  String? describe;
  String? avatar;
  String? upload;

  DataAnime({this.name, this.genre, this.describe, this.upload, this.avatar});

  DataAnime.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    genre = json['genre'];
    describe = json['describe'];
    avatar = json['avatar'];
    upload = json['upload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['genre'] = this.genre;
    data['describe'] = this.describe;
    data['avatar'] = this.avatar;
    data['upload'] = this.upload;
    return data;
  }
}
