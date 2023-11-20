import 'package:flutter/material.dart';

class Pagei extends StatefulWidget {
  const Pagei({Key? key}) : super(key: key);

  @override
  State<Pagei> createState() => _PageiState();
}

class _PageiState extends State<Pagei> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Home"),
),
    );
  }
}
