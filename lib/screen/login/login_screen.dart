import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:get/get.dart';
import 'package:records/common/themes/app_theme.dart';
import 'package:records/screen/login/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back();
        return Future.value(false);
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Flex(
              direction: Axis.vertical,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Hero(
                  tag: 'login.text1',
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 48,
                      color: Theme.of(context).textTheme.bodyText1?.color,
                    ),
                  ),
                ),
                const Text(
                  'Welcome to balabalabala',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      LoginInput(
                        labelText: 'Enter your email',
                        onChanged: (value) => controller.changeAccount(value),
                      ),
                      LoginInput(
                        labelText: 'Password',
                        onChanged: (value) => controller.changePassword(value),
                      ),

                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: controller.signIn,
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: controller.signIn,
                          child: Text(
                            'Create an account',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.red,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot password?'),
                      ),
                      // InkWell(
                      //   onTap: controller.registration,
                      //   child: const Text(
                      //     'registration',
                      //     style: TextStyle(color: Colors.amber),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: const Text('其他登录方式'),
                        margin: const EdgeInsets.only(bottom: 16),
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          GoogleSignInIconButton(
                            clientId: 'records-5e0b8',
                            redirectUri:
                                'https://records-5e0b8.firebaseapp.com/__/auth/handler',
                          ),
                          FacebookSignInIconButton(
                            clientId: 'records-5e0b8',
                            redirectUri:
                                'https://records-5e0b8.firebaseapp.com/__/auth/handler',
                          ),
                          TwitterSignInIconButton(
                            apiKey: '',
                            apiSecretKey:
                                'AIzaSyBmQ4HgqliUOE1NmdUBpKs1tQro9BXOpq4',
                            redirectUri: '',
                          ),
                          AppleSignInIconButton()
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginInput extends StatelessWidget {
  const LoginInput({Key? key, Function? this.onChanged, String? this.labelText})
      : super(key: key);
  final onChanged;
  final labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 38),
      height: 58,
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
