import 'package:empowering_questions_mobile/api/question.dart';
import 'package:empowering_questions_mobile/provider/http_request_provider.dart';

class QuestionProvider extends HttpRequestProvider {
  Question? _question;
  Question? get question => _question;

  Future<void> fetchById(String id) async {
    setIsLoading(true);
    dio.options.headers = await getToken();
    final client = RestQuestion(dio);
    Question question = await client.fetchById(id);
    _question = question;
    setIsLoading(false);
    notifyListeners();
  }
}
