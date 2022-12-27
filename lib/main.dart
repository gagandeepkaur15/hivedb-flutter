import 'package:hive/hive.dart';
import 'package:hive_db/modal.dart';
import 'package:hive_db/provider.dart';
import 'package:hive_db/screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ModalAdapter());
  await Hive.openBox<Modal>('modal');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Storage(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.brown,
            title: const Text(
              'Hive DB',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Screen(),
        ),
      ),
    );
  }
}
