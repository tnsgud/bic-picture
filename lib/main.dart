import 'package:flutter/material.dart';

import 'custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme().lightTheme,
      darkTheme: CustomTheme().darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BIG PICTURE',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              '모든 일에 큰그림을 그려보세요',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                color: Theme.of(context).iconTheme.color,
                Icons.login,
                size: Theme.of(context).textTheme.bodyMedium?.fontSize,
              ),
              label: Text(
                '구글로 로그인',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
