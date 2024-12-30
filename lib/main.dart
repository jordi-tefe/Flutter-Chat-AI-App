import 'package:jordi_gpt/Onboarding.dart';
import 'package:jordi_gpt/themenotifier.dart';
import 'package:jordi_gpt/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jordi_gpt/MyHomePage.dart';
// import 'MyHomePage.dart';


Future<void> main() async {

  await dotenv.load(fileName: '.env');

  runApp(ProviderScope(child: MyApp())
      // const MyApp()

      );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: LightMode,
      darkTheme: DarkMode,
      themeMode: ThemeMode,
      home: const Onboarding(),
    );
  }
}
