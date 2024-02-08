import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class MangmentCategories extends StatelessWidget {
  final onUpdateCategories;
  const MangmentCategories({this.onUpdateCategories, super.key});

  @override
  Widget build(BuildContext context) {
    late GroupButtonController _checkboxesController = GroupButtonController();
    return Column(children: [
      GroupButton(
        controller: _checkboxesController,
        buttons: Enum$Categories.values
            .where((category) => category != Enum$Categories.$unknown)
            .toList(),
        isRadio: false,
        buttonTextBuilder: (selected, value, context) {
          return HebrewString.registerPageGetCategoryAtHebrew(value);
        },
      ),
      TextButton(
          onPressed: () {
            List<Enum$Categories> result = Enum$Categories.values
                .where((element) => _checkboxesController.selectedIndexes
                    .contains(Enum$Categories.values.indexOf(element)))
                .toList();
            onUpdateCategories(result);
          },
          child: const Text(HebrewString.registerPageMessageNumber11))
    ]);
  }
}
