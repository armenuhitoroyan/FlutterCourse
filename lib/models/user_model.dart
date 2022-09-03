class User {
  late String name;
  late int age;
  late String gender;
  List<String>? hobbies;
  late bool isWork;
  String? image;

  User({
   required this.name,
   required this.age,
   required this.gender,
   this.hobbies,
   required this.isWork,
   this.image
  });

   User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    hobbies = json['hobbies'].cast<String>();
    isWork = json['is_work'];
    image = json['image'];

  }

}