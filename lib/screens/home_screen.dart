import 'package:big_picture/widgets/card_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 48,
                      height: 48,
                      child: CircleAvatar(
                        backgroundColor: Colors.amber,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
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
              const SizedBox(
                height: 20,
              ),
              const CardList(title: '최근 활동한 커뮤니티', list: [
                '1시간 전 키뮤 이름 - 내용',
                '1시간 전 키뮤 이름 - 내용',
                '1시간 전 키뮤 이름 - 내용',
                '1시간 전 키뮤 이름 - 내용',
                '1시간 전 키뮤 이름 - 내용',
                '1시간 전 키뮤 이름 - 내용',
                '1시간 전 키뮤 이름 - 내용',
                '1시간 전 키뮤 이름 - 내용',
                '1시간 전 키뮤 이름 - 내용',
              ]),
              TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.logout),
                label: const Text('logout'),
              )
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
