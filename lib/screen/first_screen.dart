// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //initializing dio library
  Dio dio = Dio();
  List studentsInfo = [];
  List products = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await jsonDecode(response);
    setState(() {
      studentsInfo = data["studentsInfo"];
    });
  }

//api call for getting data from api server
  Future<void> getAPIcall() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    var data = await json.decode(response.body);
    setState(() {
      products = data['products'];
    });
  }

//same get api call using dio library
  Future<void> getAPIcallDio() async {
    var url = 'https://dummyjson.com/products';
    try {
      var response = await dio.get(url);
      setState(() {
        products = response.data["products"];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // readJson();
    getAPIcall();
    getAPIcallDio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Test',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              GestureDetector(
                //  onTap: () {
                //     navigation from one screen to another screen
                //    Navigator.push(
                //      context,
                //       MaterialPageRoute(
                //          builder: (context) => SecondScreen(
                //                studentsInfo[index]['id'],
                //                studentsInfo[index]['Name'],
                //                studentsInfo[index]['fatherName'],
                //                 studentsInfo[index]['dept'],
                //                 studentsInfo[index]['description'],
                //               )),
                //    );
                //  },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    child: CachedNetworkImage(
                      imageUrl: '${products[index]['thumbnail']}',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    ),
                    //Image.network('${products[index]['thumbnail']}'),
                  ),
                  //  Text(
                  //   '${products[index]['id']}',
                  //   style: const TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  title: Text('${products[index]['title']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text(
                    '${products[index]['brand']}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
            ],
          );
        },
      ),
    );
  }
}
