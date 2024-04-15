import 'package:empowering_questions_mobile/provider/chat_provider.dart';
import 'package:empowering_questions_mobile/provider/interfaces/chat_register_provider_interface.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';

class ChatRegisterProvider extends ChatProvider
    implements ChatRegisterProviderInterface {
  Map<List<dynamic>, bool>? _suggestions;
  SuggestionsTypes _step = SuggestionsTypes.initial;
  late final Enum$Genders _gender;
  late final List<Enum$Categories> _categories;
  late final Enum$Frequency _frequency;

  @override
  Map<List<dynamic>, bool>? get suggestions => _suggestions;

  @override
  SuggestionsTypes? get step => _step;

  @override
  void nextStep() {
    switch (step) {
      case SuggestionsTypes.initial:
        _step = SuggestionsTypes.selectGender;
        _suggestions = {
          Enum$Genders.values
              .where((gender) => gender != Enum$Genders.$unknown)
              .toList(): true
        };
        break;
      case SuggestionsTypes.selectGender:
        _step = SuggestionsTypes.selectCategories;
        _suggestions = {
          Enum$Categories.values
              .where((category) => category != Enum$Categories.$unknown)
              .toList(): false
        };
        break;
      case SuggestionsTypes.selectCategories:
        _step = SuggestionsTypes.selectFrequency;

        _suggestions = {
          Enum$Frequency.values
              .where((frequency) => frequency != Enum$Frequency.$unknown)
              .toList(): true
        };
        break;

      default:
        _step = SuggestionsTypes.finish;
    }

    notifyListeners();
  }

  @override
  // TODO: implement selectedCategories
  List<Enum$Categories> get selectedCategories => _categories;

  @override
  // TODO: implement selectedFrequency
  Enum$Frequency get selectedFrequency => _frequency;

  @override
  // TODO: implement selectedGender
  Enum$Genders get selectedGender => _gender;

  @override
  void setSelectedCategories(List<Enum$Categories> categories) {
    _categories = categories;
  }

  @override
  void setSelectedFrequency(Enum$Frequency frequency) {
    _frequency = frequency;
  }

  @override
  void setSelectedGender(Enum$Genders gender) {
    _gender = gender;
  }
}
