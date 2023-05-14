class Student {
  int? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? username;
  String? password;
  String? status;
  String? email;
 String? image;

  Student(
      {this.id,
        this.firstName,
        this.lastName,
        this.gender,
        this.username,
        this.password,
        this.status,
        this.email,
        this.image});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
    id : json['id'],
    firstName : json['firstName'],
    lastName : json['lastName'],
    gender : json['gender'],
    username : json['username'],
    password : json['password'],
    status : json['status'],
    email : json['email'],
    image : json['image'],
    );}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['username'] = username;
    data['password'] = password;
    data['status'] = status;
    data['email'] = email;
    data['image'] = image;
    return data;
  }
}