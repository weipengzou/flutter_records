import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        TextButton(
          child: const Text('home'),
          onPressed: () => Get.to(const TestDetail()),
        ),
        Hero(
          tag: 'test',
          child: Image.network(
              'https://ss3.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/baike/w%3D175/sign=69b4d7a0212dd42a5f0905ac36395b2f/adaf2edda3cc7cd9338eb6103d01213fb90e915c.jpg'),
        ),
        const Text(
          'Record List',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class TestDetail extends StatelessWidget {
  const TestDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'test',
        child: Image.network(
          'https://ss3.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/baike/w%3D175/sign=69b4d7a0212dd42a5f0905ac36395b2f/adaf2edda3cc7cd9338eb6103d01213fb90e915c.jpg',
        ),
      ),
    );
  }
}
