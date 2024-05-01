import 'package:empowering_questions_mobile/api/question.dart';
import 'package:empowering_questions_mobile/provider/base_provider.dart';
import 'package:empowering_questions_mobile/provider/http_request_provider.dart';

class QuestionsProvider extends HttpRequestProvider {
  final List<Question> _questions = [];
  List<Question> get questions => _questions;
  List<String>? get excludeIds =>
      _questions.map((question) => question.id).toList();

  Future<bool> fetchRandom() async {
    dio.options.headers = await getToken();
    final client = RestQuestion(dio);
    List<Question>? questions = await client.fetchRandom(excludeIds);
    if (questions == null) {
      return true;
    }
    _questions.addAll(questions);
    notifyListeners();
    return false;
  }

  clearQuestion() {
    _questions.clear();
  }
}
