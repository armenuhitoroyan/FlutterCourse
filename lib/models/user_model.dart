class User {
  late String name;
  late int age;
  late String gender;
  late List<String> hobbies;
  late bool isWork;
  late String image;

  User({
   required this.name,
   required this.age,
   required this.gender,
   required this.hobbies,
   required this.isWork,
   required this.image
  });

   User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    hobbies = json['hobbies'].cast<String>();
    isWork = json['is_work'];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['hobbies'] = this.hobbies;
    data['is_work'] = this.isWork;
    data['image'] = this.image;
    return data;
  }

}