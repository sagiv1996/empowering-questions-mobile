part of 'category_cubit.dart';

@immutable
class CategoryState {
  final List<Enum$Categories>? selectedCategories;
  static List<Enum$Categories> genderOptions = Enum$Categories.values
      .where((category) => category != Enum$Genders.$unknown)
      .toList();

  const CategoryState({this.selectedCategories});

  CategoryState copyWith({List<Enum$Categories>? selectedCategories}) {
    return CategoryState(
      selectedCategories: selectedCategories ?? this.selectedCategories,
    );
  }
}
