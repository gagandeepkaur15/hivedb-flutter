import 'package:flutter/material.dart';
import 'package:hive_db/provider.dart';
import 'package:provider/provider.dart';
import './display.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final TextEditingController _contName = TextEditingController();
  final TextEditingController _contEmail = TextEditingController();
  final TextEditingController _contMobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
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
              context
                  .read<Storage>()
                  .addData(_contName.text, _contEmail.text, _contMobile.text);
            },
            child: const Text(
              'Save',
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Display(),
                ),
              );
            },
            child: const Text(
              'Display Data',
              style: TextStyle(
                color: Colors.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
