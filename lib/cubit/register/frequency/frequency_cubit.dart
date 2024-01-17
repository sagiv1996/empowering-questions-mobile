import 'package:bloc/bloc.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:meta/meta.dart';

part 'frequency_state.dart';

class FrequencyCubit extends Cubit<FrequencyState> {
  FrequencyCubit() : super(FrequencyState());

  void selectFrequency(Enum$Frequency selectedFrequency) {
    emit(state.copyWith(selectedFrequency: selectedFrequency));
  }
}
