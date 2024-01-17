import 'package:bloc/bloc.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:meta/meta.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderState());

  void selectGender(Enum$Genders selectedGender) {
    emit(state.copyWith(selectedGender: selectedGender));
  }
}
