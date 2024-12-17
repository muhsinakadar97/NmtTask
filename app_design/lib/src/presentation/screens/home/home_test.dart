import 'package:app_design/src/presentation/screens/widgets/network_aware.dart';
import 'package:flutter/material.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: NetworkAware(
          child: Center(
            child: Text("HOME"),
          ),
        ),
      ),
    );
  }
}
