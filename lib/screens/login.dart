import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BIG PICTURE',
              style: theme.textTheme.headlineLarge,
            ),
            Text(
              '모든 일에 큰그림을 그려보세요',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              icon: FaIcon(
                FontAwesomeIcons.google,
                size: theme.textTheme.bodyMedium?.fontSize,
              ),
              label: Text(
                '구글로 로그인',
                style:
                    theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
