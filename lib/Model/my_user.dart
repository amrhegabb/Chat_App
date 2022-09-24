class Myuser {
  static const String collectionName = "users";
  String? id;
  String? username;
  String? fullname;
  String? email;
  Myuser({this.id, this.email, this.fullname, this.username});
  Myuser.fromFireStore(Map<String, dynamic> data)
      : this(
          id: data["id"],
          username: data["username"],
          fullname: data["fullname"],
          email: data["email"],
        );
  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "username": username,
      "fullname": fullname,
      "email": email,
    };
  }
}
