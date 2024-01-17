part of 'frequency_cubit.dart';

@immutable
class FrequencyState {
  final Enum$Frequency? selectedFrequency;
  static List<Enum$Frequency> frequencyOptions = Enum$Frequency.values
      .where((frequency) => frequency != Enum$Frequency.$unknown)
      .toList();

  const FrequencyState({this.selectedFrequency});

  FrequencyState copyWith({Enum$Frequency? selectedFrequency}) {
    return FrequencyState(selectedFrequency: selectedFrequency);
  }
}
