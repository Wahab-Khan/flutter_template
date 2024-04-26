import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/Utils/UtilsHelper.dart';

enum Languages { English, arabic }

const List<String> list = <String>["English", "العربية"];

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Setting Screen")),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Change Langugae: "), DropdownMenuExample()],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  String getinitStateForDropDown(BuildContext context) {
    final locale = context.locale;
    if (locale.toString() == "ar") {
      return list.last;
    }
    return list.first;
  }

  @override
  Widget build(BuildContext context) {
    getinitStateForDropDown(context);
    return Expanded(
      child: DropdownMenu<String>(
        initialSelection: getinitStateForDropDown(context),
        expandedInsets: const EdgeInsets.all(8.0),
        onSelected: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
            // if (context.locale == )
            if (value == list.first) {
              context.setLocale(const Locale("en"));
            } else if (value == list.last) {
              context.setLocale(const Locale("ar"));
            }
            saveLocale(context.locale.toString());
          });
        },
        dropdownMenuEntries:
            list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}
