import 'dart:convert';

class DefaultRes {
  var data;

  DefaultRes({
    this.data,
  });

  factory DefaultRes.fromRawJson(String str) =>
      DefaultRes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DefaultRes.fromJson(Map<String, dynamic> json) => DefaultRes(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
