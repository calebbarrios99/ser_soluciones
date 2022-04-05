import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User({
    this.accessToken,
  });

  late String? accessToken;

  factory User.fromJson(final json) {
    return User(
      accessToken: json['access_token'],
    );
  }
  factory User.fromPreferences(dynamic json) {
    return User(
      accessToken: json['access_token'],
    );
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
  @override
  String toString() {
    return '${toJson()}';
  }
}
