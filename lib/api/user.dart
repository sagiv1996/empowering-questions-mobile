import 'package:dio/dio.dart';
import 'package:empowering_questions_mobile/env/env.dart';
import 'package:empowering_questions_mobile/provider/interfaces/chat_register_provider_interface.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'user.g.dart';

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
  final String frequency;
  final String gender;
  final List<String> categories;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
