import 'package:empowering_questions_mobile/provider/interfaces/chat_provider.interface.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';

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

  List<Enum$Categories> get selectedCategories;
  void setSelectedCategories(List<Enum$Categories> categories);

  Enum$Frequency get selectedFrequency;
  void setSelectedFrequency(Enum$Frequency frequency);

  Enum$Genders get selectedGender;
  void setSelectedGender(Enum$Genders gender);
}
