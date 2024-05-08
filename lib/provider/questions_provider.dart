import 'package:empowering_questions_mobile/api/question.dart';
import 'package:empowering_questions_mobile/provider/http_request_provider.dart';
import 'package:empowering_questions_mobile/provider/interfaces/questions_provider_interface.dart';

class QuestionsProvider extends HttpRequestProvider
    implements QuestionsProviderInterface {
  List<Question> _questions = [];

  @override
  List<Question> get questions => _questions;
  @override
  List<String>? get excludeIds =>
      _questions.map((question) => question.id).toList();

  @override
  Future<bool> fetchRandom() async {
    dio.options.headers = await getToken();
    final client = RestQuestion(dio);
    List<Question>? questions = await client.fetchRandom(excludeIds);
    if (questions == null) {
      return true;
    }
    setQuestions(questions);
    notifyListeners();
    return false;
  }

  @override
  clearQuestion() {
    _questions.clear();
  }

  @override
  void setQuestions(List<Question> questions) {
    _questions = questions;
  }
}
