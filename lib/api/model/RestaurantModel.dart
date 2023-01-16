/// id : 1
/// name : "Sultan's Dine"
/// location : "Dhanmondi, Dhaka"
/// restaurantType : "Kacchi"
/// verified : 1
/// createdAt : "2022-05-04T08:23:59.1066667"

class RestaurantModel {
  RestaurantModel({
      int? id,
      String? name,
      String? location,
      String? restaurantType,
      int? verified,
      String? createdAt,}){
    _id = id;
    _name = name;
    _location = location;
    _restaurantType = restaurantType;
    _verified = verified;
    _createdAt = createdAt;
}

  RestaurantModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _location = json['location'];
    _restaurantType = json['restaurantType'];
    _verified = json['verified'];
    _createdAt = json['createdAt'];
  }
  int? _id;
  String? _name;
  String? _location;
  String? _restaurantType;
  int? _verified;
  String? _createdAt;

  int? get id => _id;
  String? get name => _name;
  String? get location => _location;
  String? get restaurantType => _restaurantType;
  int? get verified => _verified;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['location'] = _location;
    map['restaurantType'] = _restaurantType;
    map['verified'] = _verified;
    map['createdAt'] = _createdAt;
    return map;
  }

}