import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/schema.graphql.dart';
import 'package:empowering_questions_mobile/user.graphql.dart';
import 'package:empowering_questions_mobile/view/components/loading_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:group_button/group_button.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  final _categoriesGroupButtonController = GroupButtonController();
  final _frequencyGroupButtonController = GroupButtonController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Mutation$updateUser$Widget(
            options: WidgetOptions$Mutation$updateUser(
              onCompleted: (p0, p1) {
                context.pop();
              },
            ),
            builder: (runMutation, result) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  List<Enum$Categories> selectedCategories = [];
                  for (int index
                      in _categoriesGroupButtonController.selectedIndexes) {
                    if (index >= 0 && index < Enum$Categories.values.length) {
                      selectedCategories.add(Enum$Categories.values[index]);
                    }
                  }
                  Enum$Frequency selectedFrequency = Enum$Frequency.values
                      .elementAt(
                          _frequencyGroupButtonController.selectedIndex!);

                  runMutation(
                      variables: Variables$Mutation$updateUser(
                          categories: selectedCategories,
                          frequency: selectedFrequency));
                },
              );
            },
          ),
        ),
        body: Query$findUserById$Widget(
            options: Options$Query$findUserById(
              fetchPolicy: FetchPolicy.networkOnly,
              onComplete: (p0, p1) {
                Query$findUserById$findUserById findUserById =
                    Query$findUserById.fromJson(p0!).findUserById;
                List<int> selectedIndexesCategories = Enum$Categories.values
                    .where(
                        (element) => findUserById.categories.contains(element))
                    .map((category) => category.index)
                    .toList();
                _categoriesGroupButtonController
                    .selectIndexes(selectedIndexesCategories);

                int selectedIndexFrequency = Enum$Frequency.values
                    .indexWhere((element) => element == findUserById.frequency);
                _frequencyGroupButtonController
                    .selectIndex(selectedIndexFrequency);
              },
            ),
            builder: (result, {fetchMore, refetch}) {
              return Builder(builder: (context) {
                if (result.isLoading) return const LoadingCard();
                return Column(
                  children: [
                    GroupButton<Enum$Categories>(
                      isRadio: false,
                      controller: _categoriesGroupButtonController,
                      buttons: Enum$Categories.values
                          .where(
                              (element) => element != Enum$Categories.$unknown)
                          .toList(),
                      buttonTextBuilder: (selected, value, context) =>
                          HebrewString.registerPageGetAtHebrew(value),
                      options: GroupButtonOptions(
                        unselectedTextStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    GroupButton<Enum$Frequency>(
                      controller: _frequencyGroupButtonController,
                      buttons: Enum$Frequency.values
                          .where(
                              (element) => element != Enum$Frequency.$unknown)
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
