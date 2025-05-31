import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'intro_provider.dart';
import 'intro_widget.dart';
import '../home/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IntroProvider>().startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IntroProvider>(
      builder: (context, provider, child) {
        if (provider.shouldNavigateToHome) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          });
        }

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Stack(
              children: [
                const Center(child: LogoAnimation()),
                Positioned(
                  bottom: 50,
                  right: 20,
                  child: SkipButton(
                    onPressed: () => provider.skipToHome(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
