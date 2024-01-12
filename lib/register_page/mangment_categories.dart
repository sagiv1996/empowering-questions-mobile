import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class MangmentCategories extends StatelessWidget {
  final onUpdateCategories;
  const MangmentCategories({this.onUpdateCategories, super.key});

  static const List<String> _categories = [
    'self confidence',
    'relationship',
    'positive feelings',
    'communication',
    'spiritual Questions',
    'career',
    'family life',
    'university studies',
  ];

  @override
  Widget build(BuildContext context) {
    late GroupButtonController _checkboxesController = GroupButtonController();
    return Column(children: [
      GroupButton(
        controller: _checkboxesController,
        buttons: _categories,
        isRadio: false,
      ),
      TextButton(
          onPressed: () {
            List<String> result = _categories
                .where((element) => _checkboxesController.selectedIndexes
                    .contains(_categories.indexOf(element)))
                .toList();
            onUpdateCategories(result);
          },
          child: const Text('Select'))
    ]);
  }
}
