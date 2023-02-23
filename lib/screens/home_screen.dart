import 'package:big_picture/constants/gaps.dart';
import 'package:big_picture/constants/sizes.dart';
import 'package:big_picture/widgets/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatelessWidget with Sizes, Gaps {
  HomeScreen({super.key});
  final store = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(size10),
                child: Row(
                  children: [
                    SizedBox(
                      width: size48,
                      height: size48,
                      child: const CircleAvatar(
                        backgroundColor: Colors.amber,
                      ),
                    ),
                    gapH20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '사용자 이름',
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '사용자 설정한 명언',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              gapV20,
              const Calendar(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'login',
            icon: Icon(Icons.calendar_month),
          ),
          BottomNavigationBarItem(
            label: 'list',
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            label: 'account',
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
