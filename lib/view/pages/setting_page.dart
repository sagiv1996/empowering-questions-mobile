import 'package:empowering_questions_mobile/api/user.dart';
import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/provider/user_provider.dart';
import 'package:empowering_questions_mobile/view/components/loading_card.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _categoriesGroupButtonController = GroupButtonController();
  final _frequencyGroupButtonController = GroupButtonController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserProvider>().getUser;
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.watch<UserProvider>();
    User? user = userProvider.user;

    return Scaffold(
        appBar: AppBar(),
        // appBar: AppBar(
        //   leading: Mutation$updateUser$Widget(
        //     options: WidgetOptions$Mutation$updateUser(
        //       onCompleted: (p0, p1) {
        //         context.pop();
        //       },
        //     ),
        //     builder: (runMutation, result) {
        //       return IconButton(
        //         icon: const Icon(Icons.arrow_back),
        //         onPressed: () {
        //           List<Enum$Categories> selectedCategories = [];
        //           for (int index
        //               in _categoriesGroupButtonController.selectedIndexes) {
        //             if (index >= 0 && index < Enum$Categories.values.length) {
        //               selectedCategories.add(Enum$Categories.values[index]);
        //             }
        //           }
        //           Enum$Frequency selectedFrequency = Enum$Frequency.values
        //               .elementAt(
        //                   _frequencyGroupButtonController.selectedIndex!);

        //           runMutation(
        //               variables: Variables$Mutation$updateUser(
        //                   categories: selectedCategories,
        //                   frequency: selectedFrequency));
        //         },
        //       );
        //     },
        //   ),
        // ),
        body: Builder(builder: (context) {
          if (userProvider.isLoading) {
            return const LoadingCard();
          }
          return Column(
            children: [
              GroupButton<CategoryOptions>(
                isRadio: false,
                controller: _categoriesGroupButtonController,
                buttons: CategoryOptions.values,
                onSelected: (value, index, isSelected) {
                  _categoriesGroupButtonController.selectIndex(index);
                },
                buttonBuilder: (selected, value, context) {
                  return TextButton(
                      onPressed: () {
                        if (selected) {
                          _categoriesGroupButtonController
                              .unselectIndex(value.index);
                        } else {
                          _categoriesGroupButtonController
                              .selectIndex(value.index);
                        }
                      },
                      child: Text("${value.name} $selected"));
                },
              ),
              GroupButton<FrequencyOptions>(
                controller: _frequencyGroupButtonController,
                buttons: FrequencyOptions.values,
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
        }));
  }
}
