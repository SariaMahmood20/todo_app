class UserDetailsModel {
  UserDetailsModel({
    required this.firstName,
    required this.lastName,
    required this.username,
  });

  late final String firstName;
  late final String lastName;
  late final String username;

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['username'] = username;
    return _data;
  }
}
