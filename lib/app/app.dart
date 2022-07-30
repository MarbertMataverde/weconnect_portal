import 'package:flutter/material.dart';

void main() => runApp(const BaseCommit());

class BaseCommit extends StatelessWidget {
  const BaseCommit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Base Commit',
      home: Scaffold(
        body: Center(
          child: Text('Base Commit'),
        ),
      ),
    );
  }
}
