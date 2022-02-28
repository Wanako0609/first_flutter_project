import 'package:flutter/material.dart';

import 'package:flutter_application_1/customElement/postColone.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Reseau Social'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: MyPostColone(),
      ),
    );
  }
}
