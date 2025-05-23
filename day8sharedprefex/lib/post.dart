class Post
{
  String? id;
  String? name;
  String? url;

  Post({this.id, this.name, this.url});

  factory Post.fromJson(Map<String, dynamic> json)
  {
    return Post
      (
        id : json['id'],
        name : json['name'],
        url : json['url']
      );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}