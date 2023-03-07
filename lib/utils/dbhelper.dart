import 'dart:convert';

DataModel dataModelFromJson(String str)=> DataModel.fromJson(json.decode(str));

String dataModelToJson (DataModel data)=>json.encode(data.toJson());
class DataModel {
  DataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.createdAt,
});
  String id;
  String name;
  String email;
  String phone;
  String password;
  String createdAt;

  factory DataModel.fromJson(Map<String, dynamic> json)=>DataModel(
      id:json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      createdAt: json["createdAt"]);
Map<String , dynamic >toJson()=>{
  "id":id,
  "name":name,
  "email":email,
  "phone":phone,
  "password":password,
  "createAt":createdAt
};
}
