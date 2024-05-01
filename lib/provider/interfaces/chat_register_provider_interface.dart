import 'package:empowering_questions_mobile/provider/interfaces/chat_provider.interface.dart';

enum SuggestionsTypes {
  initial,
  selectGender,
  selectFrequency,
  selectCategories,
  finish
}

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

enum FrequencyOptions {
  little,
  normal,
  extra,
}

enum GendersOptions { male, female }

abstract class ChatRegisterProviderInterface implements ChatProviderInterface {
  Map<List<dynamic>, bool>? get suggestions;
  SuggestionsTypes? get step;
  void nextStep();

  List<CategoryOptions> get selectedCategories;
  void setSelectedCategories(List<CategoryOptions> categories);

  FrequencyOptions get selectedFrequency;
  void setSelectedFrequency(FrequencyOptions frequency);

  GendersOptions get selectedGender;
  void setSelectedGender(GendersOptions gender);
}
