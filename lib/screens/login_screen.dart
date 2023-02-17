import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
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
              ElevatedButton.icon(
                icon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    'assets/images/google.svg',
                    height: 50,
                  ),
                ),
                label: Text(
                  'Sign in with Google',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.scaffoldBackgroundColor,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                icon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FaIcon(
                    FontAwesomeIcons.solidComment,
                    color: theme.scaffoldBackgroundColor,
                    size: 50,
                  ),
                ),
                label: Text(
                  'Sign in with kakao',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.scaffoldBackgroundColor,
                  ),
                ),
                onPressed: () async {
                  var callbackUrl = 'big-picture';

                  if (!kIsWeb && Platform.isWindows) {
                    callbackUrl = 'http://localhost:8000/auth.html';
                  }

                  final baseUrl = dotenv.env['BASE_URL'];
                  // final result = await launchUrl(
                  //     Uri.parse('$baseUrl/auth/google'),
                  //     mode: LaunchMode.inAppWebView);
                  final resultUrl = await FlutterWebAuth2.authenticate(
                    url: '$baseUrl/auth/google',
                    callbackUrlScheme: callbackUrl,
                  );

                  log(resultUrl);

                  // storeAuthData(url: resultUrl);

                  Navigator.pushNamed(context, '/home');
                },
              ),
              /*TextButton.icon(
                onPressed: () async {
                  
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
              )*/
            ],
          ),
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
