class UserModel
{
  String? message;
  String? status;

  UserModel({this.message, this.status});

  factory UserModel.fromJson(Map<String, dynamic> json)
  {
    return UserModel
      (
        message : json['message'],
        status : json['status']
      );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}