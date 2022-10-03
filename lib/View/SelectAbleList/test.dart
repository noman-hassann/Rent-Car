// import 'package:flutter/material.dart';
// import 'package:rent_house/widgets/widgets.dart';




// class SListe extends StatefulWidget {
//   @override
//   _SListeState createState() => _SListeState();
// }

// class _SListeState extends State<SListe> {
//   // Items in the list --> Custom Widgets
//   List<Widget> arr = [


//   ];

//   Widget getListWidget(List<Widget> items) {
//     List<Widget> list = <Widget>[];
//     for (var i = 0; i <= items.length; i++) {
//       list.add(new ListContainerHere(
//         index: i,
//       ));
//     }
//     return Column(children: list);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter App :)"),
//       ),
//       body: Center(
//         // Using a 'Row' as Horizontal ListView
//         child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal, child: getListWidget(arr)),
//       ),
//     );
//   }
// }

// // Widgets that will be rendered in the Horizontal Row
// class ListContainerHere extends StatefulWidget {
//   final int index;
//   ListContainerHere({required this.index});

//   @override
//   _ListContainerHereState createState() => _ListContainerHereState();
// }

// class _ListContainerHereState extends State<ListContainerHere> {
//   // Varibale to change the height and width accordingly
//   // Initally no item will be expanded
//   bool isExpanded = false;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: () {
//           // Changing the value of 'isExpanded' when an item is tapped in the List
//           setState(() {
//             isExpanded = !isExpanded;
//           });
//         },
//         // AnimatedContainer for slowing down the changing
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 150),
//           // Changing the width and height
//           height: isExpanded ? 250 : 150,
//           width: isExpanded ? 250 : 150,
//           // Decoration Portion of the Container

//           decoration: BoxDecoration(
//               color: Colors.blue, borderRadius: BorderRadius.circular(15.0)),
//               child:
//               SingleChildScrollView(
//                 child: Column(children: [
//                   text(title: 'Here you go again bro'),
//                   text(title: 'Here you go again bro'),
//                   text(title: 'Here you go again bro'),
//                   text(title: 'Here you go again bro'),
//                   text(title: 'Here you go again bro'),
//                   text(title: 'Here you go again bro'),
//                   text(title: 'Here you go again bro'),
//                   text(title: 'Here you go again bro'),
//                   text(title: 'Here you go again bro'),
//                   text(title: 'Here you go again bro'),
//                   text(title: 'Here you go again bro'),
                  
//                 ]),
//               ) ,
//         ),
//       ),
//     );
//   }
// }