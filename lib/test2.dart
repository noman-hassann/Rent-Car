import 'package:flutter/material.dart';
import 'package:rent_house/widgets/widgets.dart';

class StateExample extends StatefulWidget {
  const StateExample({Key? key}) : super(key: key);

  @override
  _StateExampleState createState() => _StateExampleState();
}

class _StateExampleState extends State<StateExample> {
  final numbers = List<String>.generate(7, (i) => "Number ${i + 10}");
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFA),
      body: bodyContent(),
    );
  }

  bodyContent() {
    return ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Card(
            
            color: Colors.white,
            elevation: 6,
            child: Column(

              children: [
                text(title: 'Premium Plan'),
                ListTile(
                  selected: selectedIndex == index ? true : false,
                  selectedTileColor: Colors.blue[100],
                  title: Text(numbers[index]),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ],
            ),
          );
        });
  }
}
