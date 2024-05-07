import 'package:empowering_questions_mobile/api/user.dart';
import 'package:empowering_questions_mobile/provider/chat_provider.dart';
import 'package:empowering_questions_mobile/provider/interfaces/chat_register_provider_interface.dart';

class ChatRegisterProvider extends ChatProvider
    implements ChatRegisterProviderInterface {
  Map<List<dynamic>, bool>? _suggestions;
  SuggestionsTypes _step = SuggestionsTypes.initial;
  late final GenderOptions _gender;
  late final List<CategoryOptions> _categories;
  late final FrequencyOptions _frequency;

  @override
  Map<List<dynamic>, bool>? get suggestions => _suggestions;

  @override
  SuggestionsTypes? get step => _step;

  @override
  void nextStep() {
    switch (step) {
      case SuggestionsTypes.initial:
        _step = SuggestionsTypes.selectGender;
        _suggestions = {GenderOptions.values.toList(): true};
        break;
      case SuggestionsTypes.selectGender:
        _step = SuggestionsTypes.selectCategories;
        _suggestions = {CategoryOptions.values.toList(): false};
        break;
      case SuggestionsTypes.selectCategories:
        _step = SuggestionsTypes.selectFrequency;

        _suggestions = {FrequencyOptions.values.toList(): true};
        break;

      default:
        _step = SuggestionsTypes.finish;
    }

    notifyListeners();
  }

  @override
  // TODO: implement selectedCategories
  List<CategoryOptions> get selectedCategories => _categories;

  @override
  // TODO: implement selectedFrequency
  FrequencyOptions get selectedFrequency => _frequency;

  @override
  // TODO: implement selectedGender
  GenderOptions get selectedGender => _gender;

  @override
  void setSelectedCategories(List<CategoryOptions> categories) {
    _categories = categories;
  }

  @override
  void setSelectedFrequency(FrequencyOptions frequency) {
    _frequency = frequency;
  }

  @override
  void setSelectedGender(GenderOptions gender) {
    _gender = gender;
  }
}
