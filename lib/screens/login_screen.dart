import 'dart:io';

import 'package:big_picture/constants/gaps.dart';
import 'package:big_picture/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget with Sizes, Gaps {
  const LoginScreen({super.key});

  final _store = const FlutterSecureStorage();

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
              gapV96,
              ElevatedButton.icon(
                icon: Padding(
                  padding: EdgeInsets.all(size10),
                  child: SvgPicture.asset(
                    'assets/images/google.svg',
                    height: size40 + size10,
                  ),
                ),
                label: Text(
                  'Sign in with Google',
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
                  final resultUrl = await FlutterWebAuth2.authenticate(
                    url: '$baseUrl/auth/google',
                    callbackUrlScheme: callbackUrl,
                  );

                  _storeAuthData(url: resultUrl);

                  print(await _store.readAll());

                  Navigator.pushNamed(context, '/home');
                },
              ),
              gapV20,
              ElevatedButton.icon(
                icon: Padding(
                  padding: EdgeInsets.all(size10),
                  child: FaIcon(
                    FontAwesomeIcons.solidComment,
                    color: theme.scaffoldBackgroundColor,
                    size: size40 + size10,
                  ),
                ),
                label: Text(
                  'Sign in with kakao',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.scaffoldBackgroundColor,
                  ),
                ),
                onPressed: () async {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _storeAuthData({required String url}) async {
    var queryParameters = Uri.parse(url).queryParameters;

    await _store.write(
      key: 'accessToken',
      value: queryParameters['access_token'] ?? 'access token is null',
    );
    await _store.write(
      key: 'refreshToken',
      value: queryParameters['refresh_token'] ?? 'refresh token is null',
    );
    await _store.write(
      key: 'accessExpiredAt',
      value: queryParameters['access_expired_at']!.substring(0, 19),
    );
    await _store.write(
      key: 'refreshExpiredAt',
      value: queryParameters['refresh_expired_at']!.substring(0, 19),
    );
  }
}
