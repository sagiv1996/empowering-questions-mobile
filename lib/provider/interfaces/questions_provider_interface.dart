import 'package:empowering_questions_mobile/api/question.dart';

abstract class QuestionsProviderInterface {
  List<Question> get questions;
  List<String>? get excludeIds;
  Future<bool> fetchRandom();  
  void clearQuestion();
  void addQuestions(List<Question> questions);
}
