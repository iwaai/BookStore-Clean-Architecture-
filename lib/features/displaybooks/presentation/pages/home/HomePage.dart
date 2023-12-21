import 'package:flutter/material.dart';

import './widgets/HomPageBody.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const HomePageBody());
  }
}
