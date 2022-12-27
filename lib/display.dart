import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import './provider.dart';
import 'package:provider/provider.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  final TextEditingController _contName = TextEditingController();
  final TextEditingController _contEmail = TextEditingController();
  final TextEditingController _contMobile = TextEditingController();

  @override
  void dispose() {
    Hive.box('modal').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<Storage>().value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        leading: BackButton(color: Colors.white),
        elevation: 0,
        title: const Text('Saved Data'),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: data.map((e) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(e.name),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(e.email),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(e.mobileNo),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _contName,
              decoration: const InputDecoration(
                hintText: 'Enter name',
                constraints: BoxConstraints(
                  maxWidth: 600,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _contEmail,
              decoration: const InputDecoration(
                hintText: 'Enter email',
                constraints: BoxConstraints(
                  maxWidth: 600,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _contMobile,
              decoration: const InputDecoration(
                hintText: 'Enter mobile number',
                constraints: BoxConstraints(
                  maxWidth: 600,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            OutlinedButton(
              onPressed: () {
                context.read<Storage>().updateData(
                    data[0], _contName.text, _contEmail.text, _contMobile.text);
              },
              child: const Text(
                'Update',
                style: TextStyle(
                  color: Colors.brown,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                context.read<Storage>().removeData(data[0]);
              },
              child: const Text(
                'Delete Data',
                style: TextStyle(
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
