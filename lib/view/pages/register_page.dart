import 'package:choice/choice.dart';
import 'package:empowering_questions_mobile/api/user.dart';
import 'package:empowering_questions_mobile/heberw_string.dart';
import 'package:empowering_questions_mobile/provider/user_provider.dart';
import 'package:empowering_questions_mobile/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = "/register";
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _TestState();
}

class _TestState extends State<RegisterPage> {
  List<CategoryOptions> selectedCategories = [];
  GenderOptions? selectedGender;
  FrequencyOptions? selectedFrequency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            InlineChoice<GenderOptions>.single(
              clearable: true,
              value: selectedGender,
              itemCount: GenderOptions.values.length,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              itemBuilder: (state, i) {
                return ChoiceChip(
                  selected: state.selected(GenderOptions.values[i]),
                  onSelected: state.onSelected(GenderOptions.values[i]),
                  label: Text(HebrewString.registerPageGetAtHebrew(
                      GenderOptions.values[i])),
                );
              },
              listBuilder: ChoiceList.createScrollable(
                spacing: 10,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
              ),
            ),
            InlineChoice<CategoryOptions>.multiple(
                clearable: true,
                value: selectedCategories,
                itemCount: CategoryOptions.values.length,
                onChanged: (value) {
                  setState(() {
                    selectedCategories = value;
                  });
                },
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
              itemCount: FrequencyOptions.values.length,
              onChanged: (value) {
                setState(() {
                  selectedFrequency = value;
                });
              },
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
            ElevatedButton(
                onPressed: () async {
                  try {
                    await context.read<UserProvider>().createUser(
                        frequency: selectedFrequency!,
                        categories: selectedCategories,
                        gender: selectedGender!);
                    if (context.mounted) {
                      context.push(HomePage.routeName);
                    }
                  } catch (e) {
                    print("ERROR!! $e");
                  }
                },
                child: const Text(HebrewString.registerPageRegisterButton))
          ],
        ));
  }
}
