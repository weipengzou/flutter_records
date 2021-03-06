import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:records/screen/login/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      obscureText: true,
                      onChanged: (value) => controller.changePassword(value),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () async {
                          await controller.signIn();
                          Get.back();
                        },
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
                        onPressed: () async {
                          await controller.registration();
                          Get.back();
                        },
                        child: const Text(
                          'Create an account',
                          style: TextStyle(
                            fontSize: 16,
                            // color: AppThemeScheme.red,
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
                    GestureDetector(
                      // onTap: controller.registration,
                      child: const Text(
                        'registration',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: const Text('??????????????????'),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('??????'),
                        Text('??????'),
                        Text('QQ'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginInput extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? labelText;
  final bool? obscureText;

  const LoginInput({
    Key? key,
    this.onChanged,
    this.labelText,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 38),
      height: 58,
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          labelText: labelText ?? '',
        ),
      ),
    );
  }
}
