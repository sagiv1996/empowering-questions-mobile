import 'dart:async';
import 'package:empowering_questions_mobile/api/user.dart';
import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/provider/user_provider.dart';
import 'package:empowering_questions_mobile/view/components/loading_card.dart';
import 'package:empowering_questions_mobile/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:choice/choice.dart';
import 'package:after_layout/after_layout.dart';

class SettingPage extends StatefulWidget {
  static const String routeName = "/setting";
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with AfterLayoutMixin<SettingPage> {
  List<CategoryOptions> selectedCategories = [];
  FrequencyOptions? selectedFrequency;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    UserProvider userProvider = context.read<UserProvider>();
    await userProvider.getUser();
    User? user = userProvider.user;
    selectedFrequency = user?.frequency;
    selectedCategories = user!.categories;
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.watch<UserProvider>();

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () async {
                  if (selectedCategories.isNotEmpty &&
                      selectedFrequency != null) {
                    await userProvider.updateUser(
                        categories: selectedCategories,
                        frequency: selectedFrequency!);
                  }
                  if (context.mounted) {
                    context.pushReplacement(HomePage.routeName);
                  }
                })),
        body: Builder(builder: (context) {
          if (userProvider.isLoading) {
            return const LoadingCard();
          }
          return Column(
            children: [
              InlineChoice<CategoryOptions>.multiple(
                  clearable: true,
                  value: selectedCategories,
                  onChanged: (value) {
                    setState(() {
                      selectedCategories = value;
                    });
                  },
                  itemCount: CategoryOptions.values.length,
                  itemBuilder: (state, i) {
                    return ChoiceChip(
                      selected: state.selected(CategoryOptions.values[i]),
                      onSelected: state.onSelected(CategoryOptions.values[i]),
                      label: Text(HebrewString.registerPageGetAtHebrew(
                          CategoryOptions.values[i])),
                    );
                  },
                  listBuilder: ChoiceList.createWrapped(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
                  )),
              InlineChoice<FrequencyOptions>.single(
                clearable: true,
                value: selectedFrequency,
                onChanged: (value) {
                  setState(() {
                    selectedFrequency = value;
                  });
                },
                itemCount: FrequencyOptions.values.length,
                itemBuilder: (state, i) {
                  return ChoiceChip(
                    selected: state.selected(FrequencyOptions.values[i]),
                    onSelected: state.onSelected(FrequencyOptions.values[i]),
                    label: Text(HebrewString.registerPageGetAtHebrew(
                        FrequencyOptions.values[i])),
                  );
                },
                listBuilder: ChoiceList.createScrollable(
                  spacing: 10,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
                ),
              ),
            ],
          );
        }));
  }
}
