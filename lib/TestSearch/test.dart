import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class searchClass extends StatefulWidget {
  const searchClass({super.key});

  @override
  State<searchClass> createState() => _searchClassState();
}

// ignore: camel_case_types
class _searchClassState extends State<searchClass> {
  final TextEditingController _filter =  TextEditingController();
  final dio = Dio(); // for http requests
  String _searchText = "";
  List names = []; // names we get from API
  List filteredNames = []; // names filtered by search text
  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text('Search Example');
          List titles=[];

  _ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    this._getNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _appBarTitle,
        leading: IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
      ),
      body: Container(
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = [];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['title']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(filteredNames[index].toString()),
          onTap: () => print(filteredNames.toString()),
        );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = const Icon(Icons.close);
        _appBarTitle = TextField(
          controller: _filter,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        _searchIcon = Icon(Icons.search);
        _appBarTitle = Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  var token = 'Bearer 75|nRi9uWG6ZE8IlYzQpjhuxvMcXetLsqzuxYyjPtU6';

  void _getNames() async {
    final response =
        await dio.post('https://denga.r3therapeutic.com/public/api/searchpost',
            options: Options(
              headers: {"authorization": "Bearer $token"},
            ));

    if (response.statusCode == 200) {
      setState(() {
        List tempList = [];

        tempList = response.data as List;

        for(var i=0;i<=tempList.length-1;i++)
        {
         titles.add(tempList[i]['title']);
        }
      });
    }
   
    setState(() {
      names = titles;
      names.shuffle();
      filteredNames = names;
    });
  }

}
