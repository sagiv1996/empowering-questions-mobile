part of 'gender_cubit.dart';

@immutable
class GenderState {
  final Enum$Genders? selectedGender;
  static List<Enum$Genders> genderOptions = Enum$Genders.values
      .where((gender) => gender != Enum$Genders.$unknown)
      .toList();

  const GenderState({this.selectedGender});

  GenderState copyWith({Enum$Genders? selectedGender}) {
    return GenderState(
      selectedGender: selectedGender ?? this.selectedGender,
    );
  }
}
