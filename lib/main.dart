import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ffi_example/service/my_c_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final a = TextEditingController();
  final b = TextEditingController();
  int? summ = 0;
  String? text = '';
  void add() {
    try {
      if (a.text.isEmpty || b.text.isEmpty) return;
      summ = AppCService.add(int.tryParse(a.text)!, int.tryParse(b.text)!);
      text = AppCService.getCStr();
      setState(() {});
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text.toString()),
            Text(summ.toString()),
            CupertinoTextField(
              controller: a,
              placeholder: 'a',
            ),
            CupertinoTextField(
              controller: b,
              placeholder: 'b',
            ),
            CupertinoButton(onPressed: add, child: const Text('add'))
          ],
        ),
      ),
    );
  }
}
