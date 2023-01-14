import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third Screen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.blue[200],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/V.jpg'),
            opacity: 0.1,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
