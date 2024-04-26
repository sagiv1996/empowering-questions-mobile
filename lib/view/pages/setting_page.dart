import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:empowering_questions_mobile/user.graphql.dart';
import 'package:empowering_questions_mobile/view/components/loading_card.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final _categoriesGroupButtonController = GroupButtonController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Query$findUserById$Widget(options: Options$Query$findUserById(
          onComplete: (p0, p1) {
            Query$findUserById$findUserById findUserById =
                Query$findUserById.fromJson(p0!).findUserById;
            List<Enum$Categories> selectedCategories = findUserById.categories;
            List<int> selectedIndexesCategories = Enum$Categories.values
                .where((element) => selectedCategories.contains(element))
                .map((category) => category.index)
                .toList();
            _categoriesGroupButtonController
                .selectIndexes(selectedIndexesCategories);
            Enum$Frequency frequency = findUserById.frequency;
          },
        ), builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) return const LoadingCard();
          return Builder(builder: (context) {
            Query$findUserById$findUserById findUserById =
                result.parsedData!.findUserById;
            return Column(
              children: [
                GroupButton(
                  isRadio: false,
                  controller: _categoriesGroupButtonController,
                  buttons: Enum$Categories.values
                      .where((element) => element != Enum$Categories.$unknown)
                      .toList(),
                  buttonTextBuilder: (selected, value, context) =>
                      HebrewString.registerPageGetAtHebrew(value),
                  options: GroupButtonOptions(
                    unselectedTextStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            );
          });
        }),
      );
}
