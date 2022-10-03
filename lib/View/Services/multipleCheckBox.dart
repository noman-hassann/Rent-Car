import 'package:flutter/material.dart';
import 'package:rent_house/Config/color.dart';
import 'package:rent_house/widgets/widgets.dart';

// Multi Select widget
// This widget is reusable
class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];
   List<String> _selectedItem2 = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    _selectedItem2=_selectedItems;
    print(_selectedItems);
    Navigator.pop(context, _selectedItems);

    
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('NEARBY LOCATIONS '),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: text(title: "Cancel",color: Colors.black),
          onPressed: _cancel,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
      primary: orange, //background color
      onPrimary: Colors.black, //ripple color
   ),
          child: text(title: "Submit",color: Colors.white),
          onPressed: _submit,
          
        ),
           ElevatedButton(
            style: ElevatedButton.styleFrom(
      primary: orange, //background color
      onPrimary: Colors.black, //ripple color
   ),
          child: text(title: "Submit",color: Colors.white),
          onPressed: (){
            print(_selectedItem2);
          },
          
        ),
      ],
    );
  }
}
