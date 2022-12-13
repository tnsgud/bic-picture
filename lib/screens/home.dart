import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('home'),
            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.logout),
              label: const Text('logout'),
            )
          ],
        ),
      ),
    );
  }
}
