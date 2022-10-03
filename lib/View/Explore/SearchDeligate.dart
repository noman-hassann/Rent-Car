// ignore: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rent_house/View/Explore/ExploreView.dart';
import 'package:rent_house/widgets/widgets.dart';

import 'package:shared_preferences/shared_preferences.dart';

extension DuplicateRemoval<T> on List<T> {
  List<T> get removeDupluplicate => [
        ...{...this}
      ];
}

class MySearchDelegate extends SearchDelegate {
  MySearchDelegate({required this.titles});
  List titles = [];
  List? _users;
  Map? mapResponse;
  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
    return null;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    Row(
      children: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ],
    );
    return null;
  }

  @override
  Widget buildResults(BuildContext context) => Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: _users == null
                  ? text(
                      title: "Nothing Found",
                      fontsize: 15.0,
                      fontweight: FontWeight.normal)
                  : SingleChildScrollView(
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: _users!.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 1.0,
                            // childAspectRatio: 12.0,
                            mainAxisExtent: 150,
                            maxCrossAxisExtent: 400,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return (ExploreView(indexPass: _users![index]));
                          }),
                    ),
            ),
          ],
        ),
      );
  @override
  Widget buildSuggestions(BuildContext context) {
    List searchReasults = titles.removeDupluplicate;
    List suggestions = searchReasults.where((searchReasult) {
      final result = searchReasult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              searchApi(query: query, context: context);
              print(query);
              // showResults(context);
            },
          );
        });
  }

  Future searchApi({query, context}) async {
    print("Searc Meathod invoked");
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    // print(token);
    http.Response response;
    response = await http.post(
        Uri.parse("https://denga.r3therapeutic.com/public/api/searchpost"),
        body: jsonEncode(<String, String>{
          'search_text': query,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      _users = jsonDecode(response.body);
      print(_users);

      showResults(context);
    }
  }
}
