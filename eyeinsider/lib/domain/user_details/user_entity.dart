class UserEntity {
  final String? uid;
  final String? imageUrlPath;
  final String name;
  final String gender;
  final int age;
  final DateTime dob;
  final bool previousEyeDisease;
  final String country;
  final String city;
  final int  phoneNumber;
  final String  email;

  UserEntity( { this.uid, this.imageUrlPath, required this.name,  required this.gender, required this.age, required this.dob, required this.previousEyeDisease, required this.country, required this.city, required this.phoneNumber, required this.email});
}