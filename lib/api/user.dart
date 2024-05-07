import 'package:dio/dio.dart';
import 'package:empowering_questions_mobile/env/env.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'user.g.dart';

@JsonEnum(valueField: 'name')
enum CategoryOptions {
  selfConfidence("self confidence"),
  relationship("relationship"),
  positiveFeelings("positive feelings"),
  communication("communication"),
  spiritualQuestions("spiritual Questions"),
  career("career"),
  familyLife("family life"),
  universityStudies("university studies");

  final String name;
  const CategoryOptions(this.name);
}

@JsonEnum(valueField: 'name')
enum FrequencyOptions {
  little("little"),
  normal("normal"),
  extra("extra");

  final String name;
  const FrequencyOptions(this.name);
}

@JsonEnum(valueField: 'name')
enum GenderOptions {
  male("male"),
  female("female");

  final String name;
  const GenderOptions(this.name);
}

@RestApi(baseUrl: "/user")
abstract class RestUser {
  factory RestUser(Dio dio, {String baseUrl}) = _RestUser;

  @POST('/')
  Future<User> createUser(@Body() Map<String, dynamic> map);

  @PUT('/')
  Future<User> updateUser(@Body() Map<String, dynamic> map);
  @GET('/')
  Future<User> getUser();
}

final service = RestUser(Dio(BaseOptions(baseUrl: Env.backendUrl)));

@JsonSerializable()
class User {
  const User(this.gender, this.categories,
      {required this.id, required this.frequency});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(name: '_id')
  final String id;
  final FrequencyOptions frequency;
  final GenderOptions gender;

  final List<CategoryOptions> categories;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
