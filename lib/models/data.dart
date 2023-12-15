class DataAnime {
  int? id;
  String? name;
  String? genre;
  String? descripe;
  String? avatar;

  DataAnime({this.id, this.name, this.genre, this.descripe, this.avatar});

  DataAnime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    genre = json['genre'];
    descripe = json['descripe'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['genre'] = this.genre;
    data['descripe'] = this.descripe;
    data['avatar'] = this.avatar;
    return data;
  }

  Map<String, dynamic> toJson2() {
    final Map<String, dynamic> data2 = new Map<String, dynamic>();
    data2['id'] = this.id;
    data2['name'] = this.name;
    data2['genre'] = this.genre;
    data2['descripe'] = this.descripe;
    data2['avatar'] = this.avatar;
    return data2;
  }

  Map<String, dynamic> toJson3() {
    final Map<String, dynamic> dataaction = new Map<String, dynamic>();
    dataaction['id'] = this.id;
    dataaction['name'] = this.name;
    dataaction['genre'] = this.genre;
    dataaction['descripe'] = this.descripe;
    dataaction['avatar'] = this.avatar;
    return dataaction;
  }

  Map<String, dynamic> toJson4() {
    final Map<String, dynamic> datafantasy = new Map<String, dynamic>();
    datafantasy['id'] = this.id;
    datafantasy['name'] = this.name;
    datafantasy['genre'] = this.genre;
    datafantasy['descripe'] = this.descripe;
    datafantasy['avatar'] = this.avatar;
    return datafantasy;
  }

  Map<String, dynamic> toJson5() {
    final Map<String, dynamic> dataadventure = new Map<String, dynamic>();
    dataadventure['id'] = this.id;
    dataadventure['name'] = this.name;
    dataadventure['genre'] = this.genre;
    dataadventure['descripe'] = this.descripe;
    dataadventure['avatar'] = this.avatar;
    return dataadventure;
  }

  Map<String, dynamic> toJson6() {
    final Map<String, dynamic> datacomedy = new Map<String, dynamic>();
    datacomedy['id'] = this.id;
    datacomedy['name'] = this.name;
    datacomedy['genre'] = this.genre;
    datacomedy['descripe'] = this.descripe;
    datacomedy['avatar'] = this.avatar;
    return datacomedy;
  }
}
