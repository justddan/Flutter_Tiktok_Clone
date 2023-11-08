import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("ko"),
      ],
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: Typography.blackMountainView,
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        splashColor: Colors.transparent,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade50,
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
        primaryColor: const Color(0xFFE9435A),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: Typography.whiteMountainView,
        scaffoldBackgroundColor: Colors.black,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        splashColor: Colors.transparent,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          surfaceTintColor: Colors.grey.shade900,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
          iconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade700,
        ),
        primaryColor: const Color(0xFFE9435A),
      ),
      home: const SignUpScreen(),
    );
  }
}

/*
class LayoutBuilderCodeLab extends StatelessWidget {
  const LayoutBuilderCodeLab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width / 2,
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: Colors.teal,
            child: Center(
              child: Text(
                "${size.width} / ${constraints.maxWidth}",
                style: TextStyle(
                            fontSize: 98,
                            color: Colors.white,
                          ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/

// google_fonts 사이트
// https://m2.material.io/design/typography/the-type-system.html#type-scale Type Scale Generator
