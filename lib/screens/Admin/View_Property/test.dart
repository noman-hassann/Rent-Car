// add http plugin

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rent_house/widgets/widgets.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

String? stringResponse;
Map? mapResponse;
Map? dataResponce;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = false;
  List? _users;

  @override
  void initState() {
    // TODO: implement initState
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const FittedBox(
            child: Text(
              "API Call",
            ),
          ),
        ),
        body: Center(
            child: Container(
                color: Colors.amber,
                width: size.width * 0.5,
                height: size.height * 0.2,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        children: [
                          text(title: _users![index]['address'].toString())
                        ],
                      ),
                    );
                  },
                  itemCount: _users == null ? 0 : _users!.length,
                ))
            // ? ListView.builder(
            //     itemCount: _users.length,
            //     itemBuilder: ((context, index) {
            //       return Card(
            //         margin: const EdgeInsets.symmetric(
            //           horizontal: 15.0,
            //           vertical: 10.0,
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             children: [
            //               Image.network(_users[index]['image']),
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(_users[index]['firstName']),
            //                   Text(_users[index]['email']),
            //                   Text(_users[index]['phone']),
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       );
            //     }),
            //   )

            // : Center(
            //     child: _loading
            //         ? CircularProgressIndicator()
            //         : ElevatedButton(
            //             child: const Text("fetch users"),
            //             onPressed: apiCall,
            //           ),
            //   ),

            ));
  }

  var token = 'Bearer 68|V2gnBMtaOjS2exRW2LhNKh7djOg3RxURT0OL2yL5';

  Future apiCall() async {
    http.Response response;
    response = await http.post(
        Uri.parse("https://denga.r3therapeutic.com/public/api/getpost"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      setState(() {
        //  stringResponse = response.body;
        mapResponse = jsonDecode(response.body);
        _users = mapResponse?['data'];
      });
    }
  }

  // loadUserList() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   var token = 'Bearer 68|V2gnBMtaOjS2exRW2LhNKh7djOg3RxURT0OL2yL5';
  //   var res = await http.post(
  //       Uri.https(
  //           "https://denga.r3therapeutic.com/public/api/getpost", "users"),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       });
  //   if (res.statusCode == 200) {
  //     var jsonData = jsonDecode(res.body);
  //     if (jsonData['users'].isNotEmpty) {
  //       setState(() {
  //         _users = jsonData['users'];
  //         _loading = false;
  //       });
  //     }
  //   }
  // }

}
