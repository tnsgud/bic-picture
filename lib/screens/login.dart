import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
              style: theme.textTheme.headlineMedium,
            ),
            Text(
              '모든 일에 큰그림을 그려보세요',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton.icon(
              onPressed: () async {
                var callbackUrl = 'big-picture';

                if (!kIsWeb && Platform.isWindows) {
                  callbackUrl = 'http://localhost:8000/auth.html';
                }

                final baseUrl = dotenv.env['BASE_URL'];
                final resultUrl = await FlutterWebAuth2.authenticate(
                  url: '$baseUrl/auth/google',
                  callbackUrlScheme: callbackUrl,
                );

                storeAuthData(url: resultUrl);

                const store = FlutterSecureStorage();
              },
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

  void storeAuthData({required String url}) async {
    const store = FlutterSecureStorage();
    var queryParameters = Uri.parse(url).queryParameters;

    await store.write(
      key: 'accessToken',
      value: queryParameters['access_token']!,
    );
    await store.write(
      key: 'refreshToken',
      value: queryParameters['refresh_token']!,
    );
    await store.write(
      key: 'accessExpiredAt',
      value: queryParameters['access_expired_at']!,
    );
    await store.write(
      key: 'refreshExpiredAt',
      value: queryParameters['refresh_expired_at']!,
    );
  }
}
