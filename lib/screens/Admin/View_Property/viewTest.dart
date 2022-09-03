// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:rent_house/Model/room.dart';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

// class HotelView extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         debugShowCheckedModeBanner: false,
//         home: HomePage());
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int currentPage = 1;
//   List<HotelRoom> _appartment = [];
//   late int totalPages;
//   HotelRoom? hotelData;
//   Data data=Data();

//   final RefreshController refreshController =
//       RefreshController(initialRefresh: true);

//   Future<bool> getPassengerData({bool isRefresh = false}) async {
//     if (isRefresh) {
//       currentPage = 1;
//     } else {
//       if (currentPage >= totalPages) {
//         refreshController.loadNoData();
//         return false;
//       }
//     }
//     var token = 'Bearer 68|V2gnBMtaOjS2exRW2LhNKh7djOg3RxURT0OL2yL5';

//     final Uri uri = Uri.parse(
//       "https://denga.r3therapeutic.com/public/api/getpost",
//     );
//     final response = await http.post(uri, headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     // HotelRoom hotelData;
//     var decoded = jsonDecode(response.body);
//     List mydata = decoded['data'];
//     if (response.statusCode == 200) {
//       hotelData = HotelRoom.fromJson(decoded);



//       if (isRefresh) {
//         // _appartmet = result.data;
//       } else {
//         // _appartmet.addAll(result.data);
//       }
//       currentPage++;
//       // totalPages = result.total;
//       print(response.body);
//       setState(() {});
//       return true;
//     } else {
//       return false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Infinite List Pagination"),
//       ),
//       body: SmartRefresher(
//         controller: refreshController,
//         enablePullUp: true,
//         onRefresh: () async {
//           final result = await getPassengerData(isRefresh: true);
//           if (result) {
//             refreshController.refreshCompleted();
//           } else {
//             refreshController.refreshFailed();
//           }
//         },
//         onLoading: () async {
//           final result = await getPassengerData();
//           if (result) {
//             refreshController.loadComplete();
//           } else {
//             refreshController.loadFailed();
//           }
//         },
//         child: ListView.separated(
//           itemBuilder: (context, index) {
//             if (hotelData != null) {
//                data = hotelData!.data![index];
//             }

//             return ListTile(

//               title: Text(data.bathrooms.toString()),
//                subtitle: Text(data.address.toString()),
//                trailing: Text(
//                data.area.toString(),
//                  style: TextStyle(color: Colors.green),
//                ),
               
//             );
//           },
//           separatorBuilder: (context, index) => Divider(),
//           itemCount: 1,
//         ),
//       ),
//     );
//   }
// }
