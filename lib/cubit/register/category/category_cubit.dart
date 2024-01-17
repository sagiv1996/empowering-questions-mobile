import 'package:bloc/bloc.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState());

  void selectCategories(List<Enum$Categories> categories) {
    emit(state.copyWith(selectedCategories: categories));
  }
}
