import 'package:bouncy_effect/bouncy_effect.dart';
import 'package:flutter/material.dart';

class BouncyEffectExample extends StatefulWidget {
  const BouncyEffectExample({super.key});

  @override
  State<BouncyEffectExample> createState() => _BouncyEffectExampleState();
}

class _BouncyEffectExampleState extends State<BouncyEffectExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bouncy Effect Example')),
      body: Center(
        child: BouncyEffect(
          child: Container(
            width: double.infinity,
            height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Tap me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
