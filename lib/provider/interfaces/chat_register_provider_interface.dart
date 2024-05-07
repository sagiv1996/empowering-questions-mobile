import 'package:empowering_questions_mobile/api/user.dart';
import 'package:empowering_questions_mobile/provider/interfaces/chat_provider.interface.dart';

enum SuggestionsTypes {
  initial,
  selectGender,
  selectFrequency,
  selectCategories,
  finish
}

abstract class ChatRegisterProviderInterface implements ChatProviderInterface {
  Map<List<dynamic>, bool>? get suggestions;
  SuggestionsTypes? get step;
  void nextStep();

  List<CategoryOptions> get selectedCategories;
  void setSelectedCategories(List<CategoryOptions> categories);

  FrequencyOptions get selectedFrequency;
  void setSelectedFrequency(FrequencyOptions frequency);

  GenderOptions get selectedGender;
  void setSelectedGender(GenderOptions gender);
}
