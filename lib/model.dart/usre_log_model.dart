// To parse this JSON data, do
//
//     final userLog = userLogFromJson(jsonString);

import 'dart:convert';

UserLog userLogFromJson(String str) => UserLog.fromJson(json.decode(str));

String userLogToJson(UserLog data) => json.encode(data.toJson());

class UserLog {
    String btn;
    DateTime date;

    UserLog({
        required this.btn,
        required this.date,
    });

    factory UserLog.fromJson(Map<String, dynamic> json) => UserLog(
        btn: json["btn"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "btn": btn,
        "date": date,
    };
}
