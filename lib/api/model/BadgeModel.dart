/// id : 2
/// name : "Rookie"
/// point : 200
/// createdAt : "2022-05-01T05:19:20.8352767"

class BadgeModel {
  BadgeModel({
      int? id,
      String? name,
      int? point,
      String? createdAt,}){
    _id = id;
    _name = name;
    _point = point;
    _createdAt = createdAt;
}

  BadgeModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _point = json['point'];
    _createdAt = json['createdAt'];
  }
  int? _id;
  String? _name;
  int? _point;
  String? _createdAt;

  int? get id => _id;
  String? get name => _name;
  int? get point => _point;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['point'] = _point;
    map['createdAt'] = _createdAt;
    return map;
  }

}