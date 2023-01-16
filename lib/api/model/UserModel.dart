import 'BadgeModel.dart';
import 'RestaurantModel.dart';

/// id : 7
/// phoneNumber : "+8801686352640"
/// email : "siad@gmail.com"
/// name : "Siad"
/// sex : 1
/// userType : 2
/// dp : "siad"
/// createdAt : "2021-04-15T00:00:00"
/// isFirstTime : 0
/// firebaseKey : "firebase"
/// badgeId : 2
/// badge : {"id":2,"name":"Rookie","point":200,"createdAt":"2022-05-01T05:19:20.8352767"}
/// restaurantModel : [{"id":1,"name":"Sultan's Dine","location":"Dhanmondi, Dhaka","restaurantType":"Kacchi","verified":1,"createdAt":"2022-05-04T08:23:59.1066667"}]
/// point : 0

class UserModel {
  UserModel({
      int? id,
      String? phoneNumber,
      String? email,
      String? name,
      int? sex,
      int? userType,
      String? dp,
      String? createdAt,
      int? isFirstTime,
      String? firebaseKey,
      int? badgeId,
      BadgeModel? badge,
      List<RestaurantModel>? restaurantModel,
      int? point,}){
    _id = id;
    _phoneNumber = phoneNumber;
    _email = email;
    _name = name;
    _sex = sex;
    _userType = userType;
    _dp = dp;
    _createdAt = createdAt;
    _isFirstTime = isFirstTime;
    _firebaseKey = firebaseKey;
    _badgeId = badgeId;
    _badge = badge;
    _restaurantModel = restaurantModel;
    _point = point;
}

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _phoneNumber = json['phoneNumber'];
    _email = json['email'];
    _name = json['name'];
    _sex = json['sex'];
    _userType = json['userType'];
    _dp = json['dp'];
    _createdAt = json['createdAt'];
    _isFirstTime = json['isFirstTime'];
    _firebaseKey = json['firebaseKey'];
    _badgeId = json['badgeId'];
    _badge = json['badge'] != null ? BadgeModel.fromJson(json['badge']) : null;
    if (json['restaurantModel'] != null) {
      _restaurantModel = [];
      json['restaurantModel'].forEach((v) {
        _restaurantModel?.add(RestaurantModel.fromJson(v));
      });
    }
    _point = json['point'];
  }
  int? _id;
  String? _phoneNumber;
  String? _email;
  String? _name;
  int? _sex;
  int? _userType;
  String? _dp;
  String? _createdAt;
  int? _isFirstTime;
  String? _firebaseKey;
  int? _badgeId;
  BadgeModel? _badge;
  List<RestaurantModel>? _restaurantModel;
  int? _point;

  int? get id => _id;
  String? get phoneNumber => _phoneNumber;
  String? get email => _email;
  String? get name => _name;
  int? get sex => _sex;
  int? get userType => _userType;
  String? get dp => _dp;
  String? get createdAt => _createdAt;
  int? get isFirstTime => _isFirstTime;
  String? get firebaseKey => _firebaseKey;
  int? get badgeId => _badgeId;
  BadgeModel? get badge => _badge;
  List<RestaurantModel>? get restaurantModel => _restaurantModel;
  int? get point => _point;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['phoneNumber'] = _phoneNumber;
    map['email'] = _email;
    map['name'] = _name;
    map['sex'] = _sex;
    map['userType'] = _userType;
    map['dp'] = _dp;
    map['createdAt'] = _createdAt;
    map['isFirstTime'] = _isFirstTime;
    map['firebaseKey'] = _firebaseKey;
    map['badgeId'] = _badgeId;
    if (_badge != null) {
      map['badge'] = _badge?.toJson();
    }
    if (_restaurantModel != null) {
      map['restaurantModel'] = _restaurantModel?.map((v) => v.toJson()).toList();
    }
    map['point'] = _point;
    return map;
  }

  @override
  String toString() {
    return 'UserModel{_id: $_id, _phoneNumber: $_phoneNumber, _email: $_email, _name: $_name, _sex: $_sex, _userType: $_userType, _dp: $_dp, _createdAt: $_createdAt, _isFirstTime: $_isFirstTime, _firebaseKey: $_firebaseKey, _badgeId: $_badgeId, _badge: $_badge, _restaurantModel: $_restaurantModel, _point: $_point}';
  }
}