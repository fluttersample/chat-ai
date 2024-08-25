


import 'package:ai_test/ai_injection_container.dart';
import 'package:ai_test/core/LocalDataBase/AppDatabase.dart';
import 'package:flutter/material.dart';

class DeveloperView extends StatefulWidget {
  const DeveloperView({super.key});

  @override
  State<DeveloperView> createState() => _DeveloperViewState();
}

class _DeveloperViewState extends State<DeveloperView> {
  @override
  Widget build(BuildContext context) {
    final dataBase = injector<AppDatabase>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              dataBase.deleteUserDb();
            }, child: const Text('delete UserTable')),
            const SizedBox(height: 30,),

            ElevatedButton(onPressed: () {
              dataBase.deleteMessageListDb();
            }, child: const Text('delete MessageTable')),
            const SizedBox(height: 30,),

            ElevatedButton(onPressed: () {
              dataBase.deleteEverything();
            }, child: const Text('delete All Data')),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
