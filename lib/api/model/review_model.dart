import 'UserModel.dart';

/// id : 2
/// title : "Domino's Pizza Bangladesh এর লোডেড পিজ্জা Extravaganza Feast!!"
/// description : "কিছুদিন আগেই ডোমিনোসের বনানী ব্রাঞ্চে সুস্বাদু এ পিজ্জাটি খেয়ে দেখা হয়। এর আগে দিল্লীতে সবশেষ খেয়ে দেখা হয়েছিলো ডোমিনোসের পিজ্জা। আমার কাছে স্বাদের তেমন কোন পার্থক্য লাগেনি। চলুন জেনে নেওয়া যাক এ পিজ্জার বিস্তারিত। "
/// imageList : [{"id":1,"url":"p4","createdAt":"2021-04-21T00:00:00","caption":"caption","reviewModelId":2}]
/// reviewedFoodList : [{"id":1,"foodItemModelId":1,"foodItemModel":{"id":1,"name":" Pasta","foodType":"Fast Food","verified":1,"createdAt":"2021-04-19T00:00:00"},"price":250,"isRecommended":1,"isOffer":1,"createdAt":"2021-04-21T00:00:00","priceRangeStart":250,"priceRangeEnd":250,"rating":4,"reviewModelId":2}]
/// reactionList : [{"id":1,"userModel":{"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0},"isLike":2,"isHelpful":2,"createdAt":"2022-05-20T19:42:20.71","reviewModelId":2}]
/// commentList : [{"id":1,"comment":"Wow","createdAt":"2022-05-20T19:39:51.48","userModelId":11,"userModel":{"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0},"replyList":[{"id":1,"reply":"hmmmmmmmmmmmmmmmm","createdAt":"2022-05-20T19:43:03.99","userModel":{"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0},"replyReactionList":[{"id":1,"userModel":{"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0},"isLike":1,"isHelpful":1,"createdAt":"2022-05-20T19:43:49.8333333"}]}],"commentReactionList":[{"id":1,"userModel":{"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0},"isLike":1,"isHelpful":1,"createdAt":"2022-05-20T19:43:27.87"}]}]
/// reviewedRestaurantModel : {"id":1,"servicingRating":3.5,"environmentgRating":3.5,"decorationRating":4,"createdAt":"2021-04-21T00:00:00","restaurantModelId":1,"restaurantModel":{"id":1,"name":"Sultan's Dine","location":"Dhanmondi, Dhaka","restaurantType":"Kacchi","verified":1,"createdAt":"2022-05-04T08:23:59.1066667"},"reviewModelId":2,"isRooftop":0,"isBuffet":0,"isPlayZoon":0}
/// isReview : 1
/// createdAt : "2021-04-21T00:00:00"
/// userModelId : 11
/// userModel : {"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0}

class ReviewModel {
  ReviewModel({
      int? id, 
      String? title, 
      String? description, 
      List<ImageList>? imageList, 
      List<ReviewedFoodList>? reviewedFoodList, 
      List<ReactionList>? reactionList, 
      List<CommentList>? commentList, 
      ReviewedRestaurantModel? reviewedRestaurantModel, 
      int? isReview, 
      String? createdAt, 
      int? userModelId, 
      UserModel? userModel,}){
    _id = id;
    _title = title;
    _description = description;
    _imageList = imageList;
    _reviewedFoodList = reviewedFoodList;
    _reactionList = reactionList;
    _commentList = commentList;
    _reviewedRestaurantModel = reviewedRestaurantModel;
    _isReview = isReview;
    _createdAt = createdAt;
    _userModelId = userModelId;
    _userModel = userModel;
}

  ReviewModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    if (json['imageList'] != null) {
      _imageList = [];
      json['imageList'].forEach((v) {
        _imageList?.add(ImageList.fromJson(v));
      });
    }
    if (json['reviewedFoodList'] != null) {
      _reviewedFoodList = [];
      json['reviewedFoodList'].forEach((v) {
        _reviewedFoodList?.add(ReviewedFoodList.fromJson(v));
      });
    }
    if (json['reactionList'] != null) {
      _reactionList = [];
      json['reactionList'].forEach((v) {
        _reactionList?.add(ReactionList.fromJson(v));
      });
    }
    if (json['commentList'] != null) {
      _commentList = [];
      json['commentList'].forEach((v) {
        _commentList?.add(CommentList.fromJson(v));
      });
    }
    _reviewedRestaurantModel = json['reviewedRestaurantModel'] != null ? ReviewedRestaurantModel.fromJson(json['reviewedRestaurantModel']) : null;
    _isReview = json['isReview'];
    _createdAt = json['createdAt'];
    _userModelId = json['userModelId'];
    _userModel = json['userModel'] != null ? UserModel.fromJson(json['userModel']) : null;
  }
  int? _id;
  String? _title;
  String? _description;
  List<ImageList>? _imageList;
  List<ReviewedFoodList>? _reviewedFoodList;
  List<ReactionList>? _reactionList;
  List<CommentList>? _commentList;
  ReviewedRestaurantModel? _reviewedRestaurantModel;
  int? _isReview;
  String? _createdAt;
  int? _userModelId;
  UserModel? _userModel;

  int? get id => _id;
  String? get title => _title;
  String? get description => _description;
  List<ImageList>? get imageList => _imageList;
  List<ReviewedFoodList>? get reviewedFoodList => _reviewedFoodList;
  List<ReactionList>? get reactionList => _reactionList;
  List<CommentList>? get commentList => _commentList;
  ReviewedRestaurantModel? get reviewedRestaurantModel => _reviewedRestaurantModel;
  int? get isReview => _isReview;
  String? get createdAt => _createdAt;
  int? get userModelId => _userModelId;
  UserModel? get userModel => _userModel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    if (_imageList != null) {
      map['imageList'] = _imageList?.map((v) => v.toJson()).toList();
    }
    if (_reviewedFoodList != null) {
      map['reviewedFoodList'] = _reviewedFoodList?.map((v) => v.toJson()).toList();
    }
    if (_reactionList != null) {
      map['reactionList'] = _reactionList?.map((v) => v.toJson()).toList();
    }
    if (_commentList != null) {
      map['commentList'] = _commentList?.map((v) => v.toJson()).toList();
    }
    if (_reviewedRestaurantModel != null) {
      map['reviewedRestaurantModel'] = _reviewedRestaurantModel?.toJson();
    }
    map['isReview'] = _isReview;
    map['createdAt'] = _createdAt;
    map['userModelId'] = _userModelId;
    if (_userModel != null) {
      map['userModel'] = _userModel?.toJson();
    }
    return map;
  }

}

/// id : 11
/// phoneNumber : "+8801686352645"
/// email : "asd@gmail.com"
/// name : "asd"
/// sex : 1
/// userType : 1
/// dp : "asd"
/// createdAt : "2022-05-11T03:24:00"
/// isFirstTime : 2
/// firebaseKey : "firebase"
/// badgeId : 2
/// badge : null
/// restaurantModel : null
/// point : 0



/// id : 1
/// servicingRating : 3.5
/// environmentgRating : 3.5
/// decorationRating : 4
/// createdAt : "2021-04-21T00:00:00"
/// restaurantModelId : 1
/// restaurantModel : {"id":1,"name":"Sultan's Dine","location":"Dhanmondi, Dhaka","restaurantType":"Kacchi","verified":1,"createdAt":"2022-05-04T08:23:59.1066667"}
/// reviewModelId : 2
/// isRooftop : 0
/// isBuffet : 0
/// isPlayZoon : 0

class ReviewedRestaurantModel {
  ReviewedRestaurantModel({
      int? id, 
      double? servicingRating, 
      double? environmentgRating, 
      int? decorationRating, 
      String? createdAt, 
      int? restaurantModelId, 
      RestaurantModel? restaurantModel, 
      int? reviewModelId, 
      int? isRooftop, 
      int? isBuffet, 
      int? isPlayZoon,}){
    _id = id;
    _servicingRating = servicingRating;
    _environmentgRating = environmentgRating;
    _decorationRating = decorationRating;
    _createdAt = createdAt;
    _restaurantModelId = restaurantModelId;
    _restaurantModel = restaurantModel;
    _reviewModelId = reviewModelId;
    _isRooftop = isRooftop;
    _isBuffet = isBuffet;
    _isPlayZoon = isPlayZoon;
}

  ReviewedRestaurantModel.fromJson(dynamic json) {
    _id = json['id'];
    _servicingRating = json['servicingRating'];
    _environmentgRating = json['environmentgRating'];
    _decorationRating = json['decorationRating'];
    _createdAt = json['createdAt'];
    _restaurantModelId = json['restaurantModelId'];
    _restaurantModel = json['restaurantModel'] != null ? RestaurantModel.fromJson(json['restaurantModel']) : null;
    _reviewModelId = json['reviewModelId'];
    _isRooftop = json['isRooftop'];
    _isBuffet = json['isBuffet'];
    _isPlayZoon = json['isPlayZoon'];
  }
  int? _id;
  double? _servicingRating;
  double? _environmentgRating;
  int? _decorationRating;
  String? _createdAt;
  int? _restaurantModelId;
  RestaurantModel? _restaurantModel;
  int? _reviewModelId;
  int? _isRooftop;
  int? _isBuffet;
  int? _isPlayZoon;

  int? get id => _id;
  double? get servicingRating => _servicingRating;
  double? get environmentgRating => _environmentgRating;
  int? get decorationRating => _decorationRating;
  String? get createdAt => _createdAt;
  int? get restaurantModelId => _restaurantModelId;
  RestaurantModel? get restaurantModel => _restaurantModel;
  int? get reviewModelId => _reviewModelId;
  int? get isRooftop => _isRooftop;
  int? get isBuffet => _isBuffet;
  int? get isPlayZoon => _isPlayZoon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['servicingRating'] = _servicingRating;
    map['environmentgRating'] = _environmentgRating;
    map['decorationRating'] = _decorationRating;
    map['createdAt'] = _createdAt;
    map['restaurantModelId'] = _restaurantModelId;
    if (_restaurantModel != null) {
      map['restaurantModel'] = _restaurantModel?.toJson();
    }
    map['reviewModelId'] = _reviewModelId;
    map['isRooftop'] = _isRooftop;
    map['isBuffet'] = _isBuffet;
    map['isPlayZoon'] = _isPlayZoon;
    return map;
  }

}

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

/// id : 1
/// comment : "Wow"
/// createdAt : "2022-05-20T19:39:51.48"
/// userModelId : 11
/// userModel : {"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0}
/// replyList : [{"id":1,"reply":"hmmmmmmmmmmmmmmmm","createdAt":"2022-05-20T19:43:03.99","userModel":{"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0},"replyReactionList":[{"id":1,"userModel":{"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0},"isLike":1,"isHelpful":1,"createdAt":"2022-05-20T19:43:49.8333333"}]}]
/// commentReactionList : [{"id":1,"userModel":{"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0},"isLike":1,"isHelpful":1,"createdAt":"2022-05-20T19:43:27.87"}]

class CommentList {
  CommentList({
      int? id, 
      String? comment, 
      String? createdAt, 
      int? userModelId, 
      UserModel? userModel, 
      List<ReplyList>? replyList, 
      List<CommentReactionList>? commentReactionList,}){
    _id = id;
    _comment = comment;
    _createdAt = createdAt;
    _userModelId = userModelId;
    _userModel = userModel;
    _replyList = replyList;
    _commentReactionList = commentReactionList;
}

  CommentList.fromJson(dynamic json) {
    _id = json['id'];
    _comment = json['comment'];
    _createdAt = json['createdAt'];
    _userModelId = json['userModelId'];
    _userModel = json['userModel'] != null ? UserModel.fromJson(json['userModel']) : null;
    if (json['replyList'] != null) {
      _replyList = [];
      json['replyList'].forEach((v) {
        _replyList?.add(ReplyList.fromJson(v));
      });
    }
    if (json['commentReactionList'] != null) {
      _commentReactionList = [];
      json['commentReactionList'].forEach((v) {
        _commentReactionList?.add(CommentReactionList.fromJson(v));
      });
    }
  }
  int? _id;
  String? _comment;
  String? _createdAt;
  int? _userModelId;
  UserModel? _userModel;
  List<ReplyList>? _replyList;
  List<CommentReactionList>? _commentReactionList;

  int? get id => _id;
  String? get comment => _comment;
  String? get createdAt => _createdAt;
  int? get userModelId => _userModelId;
  UserModel? get userModel => _userModel;
  List<ReplyList>? get replyList => _replyList;
  List<CommentReactionList>? get commentReactionList => _commentReactionList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['comment'] = _comment;
    map['createdAt'] = _createdAt;
    map['userModelId'] = _userModelId;
    if (_userModel != null) {
      map['userModel'] = _userModel?.toJson();
    }
    if (_replyList != null) {
      map['replyList'] = _replyList?.map((v) => v.toJson()).toList();
    }
    if (_commentReactionList != null) {
      map['commentReactionList'] = _commentReactionList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// userModel : {"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0}
/// isLike : 1
/// isHelpful : 1
/// createdAt : "2022-05-20T19:43:27.87"

class CommentReactionList {
  CommentReactionList({
      int? id, 
      UserModel? userModel, 
      int? isLike, 
      int? isHelpful, 
      String? createdAt,}){
    _id = id;
    _userModel = userModel;
    _isLike = isLike;
    _isHelpful = isHelpful;
    _createdAt = createdAt;
}

  CommentReactionList.fromJson(dynamic json) {
    _id = json['id'];
    _userModel = json['userModel'] != null ? UserModel.fromJson(json['userModel']) : null;
    _isLike = json['isLike'];
    _isHelpful = json['isHelpful'];
    _createdAt = json['createdAt'];
  }
  int? _id;
  UserModel? _userModel;
  int? _isLike;
  int? _isHelpful;
  String? _createdAt;

  int? get id => _id;
  UserModel? get userModel => _userModel;
  int? get isLike => _isLike;
  int? get isHelpful => _isHelpful;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_userModel != null) {
      map['userModel'] = _userModel?.toJson();
    }
    map['isLike'] = _isLike;
    map['isHelpful'] = _isHelpful;
    map['createdAt'] = _createdAt;
    return map;
  }

}

/// id : 11
/// phoneNumber : "+8801686352645"
/// email : "asd@gmail.com"
/// name : "asd"
/// sex : 1
/// userType : 1
/// dp : "asd"
/// createdAt : "2022-05-11T03:24:00"
/// isFirstTime : 2
/// firebaseKey : "firebase"
/// badgeId : 2
/// badge : null
/// restaurantModel : null
/// point : 0



/// id : 1
/// reply : "hmmmmmmmmmmmmmmmm"
/// createdAt : "2022-05-20T19:43:03.99"
/// userModel : {"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0}
/// replyReactionList : [{"id":1,"userModel":{"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0},"isLike":1,"isHelpful":1,"createdAt":"2022-05-20T19:43:49.8333333"}]

class ReplyList {
  ReplyList({
      int? id, 
      String? reply, 
      String? createdAt, 
      UserModel? userModel, 
      List<ReplyReactionList>? replyReactionList,}){
    _id = id;
    _reply = reply;
    _createdAt = createdAt;
    _userModel = userModel;
    _replyReactionList = replyReactionList;
}

  ReplyList.fromJson(dynamic json) {
    _id = json['id'];
    _reply = json['reply'];
    _createdAt = json['createdAt'];
    _userModel = json['userModel'] != null ? UserModel.fromJson(json['userModel']) : null;
    if (json['replyReactionList'] != null) {
      _replyReactionList = [];
      json['replyReactionList'].forEach((v) {
        _replyReactionList?.add(ReplyReactionList.fromJson(v));
      });
    }
  }
  int? _id;
  String? _reply;
  String? _createdAt;
  UserModel? _userModel;
  List<ReplyReactionList>? _replyReactionList;

  int? get id => _id;
  String? get reply => _reply;
  String? get createdAt => _createdAt;
  UserModel? get userModel => _userModel;
  List<ReplyReactionList>? get replyReactionList => _replyReactionList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['reply'] = _reply;
    map['createdAt'] = _createdAt;
    if (_userModel != null) {
      map['userModel'] = _userModel?.toJson();
    }
    if (_replyReactionList != null) {
      map['replyReactionList'] = _replyReactionList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// userModel : {"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0}
/// isLike : 1
/// isHelpful : 1
/// createdAt : "2022-05-20T19:43:49.8333333"

class ReplyReactionList {
  ReplyReactionList({
      int? id, 
      UserModel? userModel, 
      int? isLike, 
      int? isHelpful, 
      String? createdAt,}){
    _id = id;
    _userModel = userModel;
    _isLike = isLike;
    _isHelpful = isHelpful;
    _createdAt = createdAt;
}

  ReplyReactionList.fromJson(dynamic json) {
    _id = json['id'];
    _userModel = json['userModel'] != null ? UserModel.fromJson(json['userModel']) : null;
    _isLike = json['isLike'];
    _isHelpful = json['isHelpful'];
    _createdAt = json['createdAt'];
  }
  int? _id;
  UserModel? _userModel;
  int? _isLike;
  int? _isHelpful;
  String? _createdAt;

  int? get id => _id;
  UserModel? get userModel => _userModel;
  int? get isLike => _isLike;
  int? get isHelpful => _isHelpful;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_userModel != null) {
      map['userModel'] = _userModel?.toJson();
    }
    map['isLike'] = _isLike;
    map['isHelpful'] = _isHelpful;
    map['createdAt'] = _createdAt;
    return map;
  }

}

/// id : 11
/// phoneNumber : "+8801686352645"
/// email : "asd@gmail.com"
/// name : "asd"
/// sex : 1
/// userType : 1
/// dp : "asd"
/// createdAt : "2022-05-11T03:24:00"
/// isFirstTime : 2
/// firebaseKey : "firebase"
/// badgeId : 2
/// badge : null
/// restaurantModel : null
/// point : 0


/// id : 11
/// phoneNumber : "+8801686352645"
/// email : "asd@gmail.com"
/// name : "asd"
/// sex : 1
/// userType : 1
/// dp : "asd"
/// createdAt : "2022-05-11T03:24:00"
/// isFirstTime : 2
/// firebaseKey : "firebase"
/// badgeId : 2
/// badge : null
/// restaurantModel : null
/// point : 0



/// id : 11
/// phoneNumber : "+8801686352645"
/// email : "asd@gmail.com"
/// name : "asd"
/// sex : 1
/// userType : 1
/// dp : "asd"
/// createdAt : "2022-05-11T03:24:00"
/// isFirstTime : 2
/// firebaseKey : "firebase"
/// badgeId : 2
/// badge : null
/// restaurantModel : null
/// point : 0



/// id : 1
/// userModel : {"id":11,"phoneNumber":"+8801686352645","email":"asd@gmail.com","name":"asd","sex":1,"userType":1,"dp":"asd","createdAt":"2022-05-11T03:24:00","isFirstTime":2,"firebaseKey":"firebase","badgeId":2,"badge":null,"restaurantModel":null,"point":0}
/// isLike : 2
/// isHelpful : 2
/// createdAt : "2022-05-20T19:42:20.71"
/// reviewModelId : 2

class ReactionList {
  ReactionList({
      int? id, 
      UserModel? userModel, 
      int? isLike, 
      int? isHelpful, 
      String? createdAt, 
      int? reviewModelId,}){
    _id = id;
    _userModel = userModel;
    _isLike = isLike;
    _isHelpful = isHelpful;
    _createdAt = createdAt;
    _reviewModelId = reviewModelId;
}

  ReactionList.fromJson(dynamic json) {
    _id = json['id'];
    _userModel = json['userModel'] != null ? UserModel.fromJson(json['userModel']) : null;
    _isLike = json['isLike'];
    _isHelpful = json['isHelpful'];
    _createdAt = json['createdAt'];
    _reviewModelId = json['reviewModelId'];
  }
  int? _id;
  UserModel? _userModel;
  int? _isLike;
  int? _isHelpful;
  String? _createdAt;
  int? _reviewModelId;

  int? get id => _id;
  UserModel? get userModel => _userModel;
  int? get isLike => _isLike;
  int? get isHelpful => _isHelpful;
  String? get createdAt => _createdAt;
  int? get reviewModelId => _reviewModelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_userModel != null) {
      map['userModel'] = _userModel?.toJson();
    }
    map['isLike'] = _isLike;
    map['isHelpful'] = _isHelpful;
    map['createdAt'] = _createdAt;
    map['reviewModelId'] = _reviewModelId;
    return map;
  }

}

/// id : 11
/// phoneNumber : "+8801686352645"
/// email : "asd@gmail.com"
/// name : "asd"
/// sex : 1
/// userType : 1
/// dp : "asd"
/// createdAt : "2022-05-11T03:24:00"
/// isFirstTime : 2
/// firebaseKey : "firebase"
/// badgeId : 2
/// badge : null
/// restaurantModel : null
/// point : 0



/// id : 1
/// foodItemModelId : 1
/// foodItemModel : {"id":1,"name":" Pasta","foodType":"Fast Food","verified":1,"createdAt":"2021-04-19T00:00:00"}
/// price : 250
/// isRecommended : 1
/// isOffer : 1
/// createdAt : "2021-04-21T00:00:00"
/// priceRangeStart : 250
/// priceRangeEnd : 250
/// rating : 4
/// reviewModelId : 2

class ReviewedFoodList {
  ReviewedFoodList({
      int? id, 
      int? foodItemModelId, 
      FoodItemModel? foodItemModel, 
      int? price, 
      int? isRecommended, 
      int? isOffer, 
      String? createdAt, 
      int? priceRangeStart, 
      int? priceRangeEnd, 
      int? rating, 
      int? reviewModelId,}){
    _id = id;
    _foodItemModelId = foodItemModelId;
    _foodItemModel = foodItemModel;
    _price = price;
    _isRecommended = isRecommended;
    _isOffer = isOffer;
    _createdAt = createdAt;
    _priceRangeStart = priceRangeStart;
    _priceRangeEnd = priceRangeEnd;
    _rating = rating;
    _reviewModelId = reviewModelId;
}

  ReviewedFoodList.fromJson(dynamic json) {
    _id = json['id'];
    _foodItemModelId = json['foodItemModelId'];
    _foodItemModel = json['foodItemModel'] != null ? FoodItemModel.fromJson(json['foodItemModel']) : null;
    _price = json['price'];
    _isRecommended = json['isRecommended'];
    _isOffer = json['isOffer'];
    _createdAt = json['createdAt'];
    _priceRangeStart = json['priceRangeStart'];
    _priceRangeEnd = json['priceRangeEnd'];
    _rating = json['rating'];
    _reviewModelId = json['reviewModelId'];
  }
  int? _id;
  int? _foodItemModelId;
  FoodItemModel? _foodItemModel;
  int? _price;
  int? _isRecommended;
  int? _isOffer;
  String? _createdAt;
  int? _priceRangeStart;
  int? _priceRangeEnd;
  int? _rating;
  int? _reviewModelId;

  int? get id => _id;
  int? get foodItemModelId => _foodItemModelId;
  FoodItemModel? get foodItemModel => _foodItemModel;
  int? get price => _price;
  int? get isRecommended => _isRecommended;
  int? get isOffer => _isOffer;
  String? get createdAt => _createdAt;
  int? get priceRangeStart => _priceRangeStart;
  int? get priceRangeEnd => _priceRangeEnd;
  int? get rating => _rating;
  int? get reviewModelId => _reviewModelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['foodItemModelId'] = _foodItemModelId;
    if (_foodItemModel != null) {
      map['foodItemModel'] = _foodItemModel?.toJson();
    }
    map['price'] = _price;
    map['isRecommended'] = _isRecommended;
    map['isOffer'] = _isOffer;
    map['createdAt'] = _createdAt;
    map['priceRangeStart'] = _priceRangeStart;
    map['priceRangeEnd'] = _priceRangeEnd;
    map['rating'] = _rating;
    map['reviewModelId'] = _reviewModelId;
    return map;
  }

}

/// id : 1
/// name : " Pasta"
/// foodType : "Fast Food"
/// verified : 1
/// createdAt : "2021-04-19T00:00:00"

class FoodItemModel {
  FoodItemModel({
      int? id, 
      String? name, 
      String? foodType, 
      int? verified, 
      String? createdAt,}){
    _id = id;
    _name = name;
    _foodType = foodType;
    _verified = verified;
    _createdAt = createdAt;
}

  FoodItemModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _foodType = json['foodType'];
    _verified = json['verified'];
    _createdAt = json['createdAt'];
  }
  int? _id;
  String? _name;
  String? _foodType;
  int? _verified;
  String? _createdAt;

  int? get id => _id;
  String? get name => _name;
  String? get foodType => _foodType;
  int? get verified => _verified;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['foodType'] = _foodType;
    map['verified'] = _verified;
    map['createdAt'] = _createdAt;
    return map;
  }

}

/// id : 1
/// url : "p4"
/// createdAt : "2021-04-21T00:00:00"
/// caption : "caption"
/// reviewModelId : 2

class ImageList {
  ImageList({
      int? id, 
      String? url, 
      String? createdAt, 
      String? caption, 
      int? reviewModelId,}){
    _id = id;
    _url = url;
    _createdAt = createdAt;
    _caption = caption;
    _reviewModelId = reviewModelId;
}

  ImageList.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
    _createdAt = json['createdAt'];
    _caption = json['caption'];
    _reviewModelId = json['reviewModelId'];
  }
  int? _id;
  String? _url;
  String? _createdAt;
  String? _caption;
  int? _reviewModelId;

  int? get id => _id;
  String? get url => _url;
  String? get createdAt => _createdAt;
  String? get caption => _caption;
  int? get reviewModelId => _reviewModelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    map['createdAt'] = _createdAt;
    map['caption'] = _caption;
    map['reviewModelId'] = _reviewModelId;
    return map;
  }

}