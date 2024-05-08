import 'package:empowering_questions_mobile/api/question.dart';
import 'package:empowering_questions_mobile/provider/http_request_provider.dart';
import 'package:empowering_questions_mobile/provider/interfaces/question_provider_interface.dart';

class QuestionProvider extends HttpRequestProvider
    implements QuestionProviderInterface {
  Question? _question;
  @override
  Question? get question => _question;

  @override
  Future<void> fetchById(String id) async {
    setIsLoading(true);
    dio.options.headers = await getToken();
    final client = RestQuestion(dio);
    Question question = await client.fetchById(id);
    setQuestion(question);
    setIsLoading(false);
    notifyListeners();
  }

  @override
  void setQuestion(Question question) {
    _question = question;
  }
}
