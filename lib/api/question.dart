import 'package:dio/dio.dart';
import 'package:empowering_questions_mobile/env/env.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'question.g.dart';

final a = Env.backendUrl;

@RestApi(baseUrl: "/question")
abstract class RestQuestion {
  factory RestQuestion(Dio dio, {String baseUrl}) = _RestQuestion;

  @GET(
    '/random',
  )
  Future<List<Question>>? fetchRandom(
    @Query("excludeIds") List<String>? excludeIds,
  );

  @GET('/{id}')
  Future<Question> fetchById(@Path() String id);
}

final service = RestQuestion(Dio(BaseOptions(baseUrl: Env.backendUrl)));

@JsonSerializable()
class Question {
  const Question({
    required this.id,
    required this.string,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @JsonKey(name: '_id')
  final String id;
  final String string;

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
