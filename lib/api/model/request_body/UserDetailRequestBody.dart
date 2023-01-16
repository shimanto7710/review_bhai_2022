
/// phoneNumber : "+8801686352645"
/// email : "shimanto@gmail.com"
/// name : "Shimanto Ahmed"
/// sex : 1
/// userType : 1
/// dp : "shimanto"
/// createdAt : "2021-04-15T00:00:00"
/// isFirstTime : 1
/// firebaseKey : "firebase"
/// badgeId : 1

class UserDetailRequestBody {
  String? _phoneNumber;
  String? _email;
  String? _name;
  int? _sex;
  int? _userType;
  String? _dp;
  String? _createdAt;
  int? _isFirstTime;
  String? _firebaseKey;


  String? get phoneNumber => _phoneNumber;
  String? get email => _email;
  String? get name => _name;
  int? get sex => _sex;
  int? get userType => _userType;
  String? get dp => _dp;
  String? get createdAt => _createdAt;
  int? get isFirstTime => _isFirstTime;
  String? get firebaseKey => _firebaseKey;


  UserDetailRequestBody({
    String? phoneNumber,
    String? email,
    String? name,
    int? sex,
    int? userType,
    String? dp,
    String? createdAt,
    int? isFirstTime,
    String? firebaseKey,
    int? badgeId}){
    _phoneNumber = phoneNumber;
    _email = email;
    _name = name;
    _sex = sex;
    _userType = userType;
    _dp = dp;
    _createdAt = createdAt;
    _isFirstTime = isFirstTime;
    _firebaseKey = firebaseKey;

  }

  UserDetailRequestBody.fromJson(dynamic json) {
    _phoneNumber = json["phoneNumber"];
    _email = json["email"];
    _name = json["name"];
    _sex = json["sex"];
    _userType = json["userType"];
    _dp = json["dp"];
    _createdAt = json["createdAt"];
    _isFirstTime = json["isFirstTime"];
    _firebaseKey = json["firebaseKey"];

  }


  @override
  String toString() {
    return 'UserDetailRequestBody{_phoneNumber: $_phoneNumber, _email: $_email, _name: $_name, _sex: $_sex, _userType: $_userType, _dp: $_dp, _createdAt: $_createdAt, _isFirstTime: $_isFirstTime, _firebaseKey: $_firebaseKey}';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["phoneNumber"] = _phoneNumber;
    map["email"] = _email;
    map["name"] = _name;
    map["sex"] = _sex;
    map["userType"] = _userType;
    map["dp"] = _dp;
    map["createdAt"] = _createdAt;
    map["isFirstTime"] = _isFirstTime;
    map["firebaseKey"] = _firebaseKey;
    return map;
  }

}