import 'package:flutter/material.dart';

class AutocompleteExample extends StatefulWidget {
  const AutocompleteExample({super.key});

  @override
  State<AutocompleteExample> createState() => _AutocompleteExampleState();
}

class _AutocompleteExampleState extends State<AutocompleteExample> {
  TextEditingController controller = TextEditingController();
  List suggestionList = [];
  String hint = "";

  List<String> nameList = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
    'Nathaniel Bond',
    'Taylor Story',
    'Lamont Padilla',
    'Jamia Sun',
    'Nikki Reichert',
    'Tea Holguin',
    'Rafael Meade',
    'Mercedez Goad',
    'Aileen Foltz',
    'Bryant Burt',
  ];

  void typeAheadFilter(String value) {
    suggestionList.clear();

    if (value.isEmpty) {
      setState(() {});
      return;
    }

    for (String name in nameList) {
      if (name.toLowerCase().contains(value)) {
        suggestionList.add(name);
      }
    }

    if (suggestionList.isNotEmpty) {
      var firstSuggestion = suggestionList[0];

      setState(() => hint = firstSuggestion);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: controller,
          onFieldSubmitted: (value) {},
          onChanged: (value) => typeAheadFilter(value),
          decoration: InputDecoration(
              hintText: hint,
              labelText: hint.isEmpty ? "Search" : hint,
              alignLabelWithHint: true,
              hintTextDirection: TextDirection.rtl),
        ),
        const SizedBox(height: 10),
        if (suggestionList.isNotEmpty || controller.text.isNotEmpty) ...[
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: suggestionList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Text((suggestionList[index]));
              },
            ),
          )
        ] else ...[
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: nameList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Text((nameList[index]));
              },
            ),
          )
        ]
      ],
    );
  }
}