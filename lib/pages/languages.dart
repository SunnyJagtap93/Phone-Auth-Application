import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  List<String> items = ['English', 'Hindi', 'Gujarati', 'Marathi'];
  String? selectedItem = 'English';

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: SizedBox(
        width: 270,
        height: 70,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(),
          )),
          value: selectedItem,
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
              .toList(),
          onChanged: (item) {
            selectedItem = item;
          },
        ),
      ),
    ));
  }
}
