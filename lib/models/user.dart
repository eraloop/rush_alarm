
class User {
  int? id;
  String? phone;
  String? longitude;
  String? latitude;

  User({this.id, this.phone, this.longitude, this.latitude});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }

}