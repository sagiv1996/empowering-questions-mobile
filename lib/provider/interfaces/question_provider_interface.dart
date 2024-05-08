import 'package:empowering_questions_mobile/api/question.dart';

abstract class QuestionProviderInterface {
  Question? get question;
  void setQuestion(Question question);
  Future<void> fetchById(String id);
}
