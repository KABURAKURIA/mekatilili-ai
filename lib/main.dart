import '/custom_code/actions/index.dart' as actions;
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

import '/backend/firebase_dynamic_links/firebase_dynamic_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initFirebase();

  // Start initial custom actions code
  await actions.lockOrientation();
  // End initial custom actions code

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.entryPage});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  final Widget? entryPage;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier, widget.entryPage);
    userStream = mekatililiFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MEKATILILI',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
        Locale('kk'),
        Locale('pa'),
        Locale('mr'),
        Locale('si'),
        Locale('sr'),
        Locale('bg'),
        Locale('fi'),
        Locale('cs'),
        Locale('lt'),
        Locale('hr'),
        Locale('ka'),
        Locale('az'),
        Locale('sl'),
        Locale('et'),
        Locale('km'),
        Locale('uz'),
        Locale('bs'),
        Locale('lv'),
        Locale('bn'),
        Locale('ky'),
        Locale('is'),
        Locale('sq'),
        Locale('be'),
        Locale('lo'),
        Locale('mn'),
        Locale('uk'),
        Locale('my'),
        Locale('ne'),
        Locale('eu'),
        Locale('pt'),
        Locale('pl'),
        Locale('ar'),
        Locale('hi'),
        Locale('fr'),
        Locale('de'),
        Locale('zu'),
        Locale('af'),
        Locale('ja'),
        Locale('th'),
        Locale('ko'),
        Locale('it'),
        Locale('ms'),
        Locale('nl'),
        Locale('id'),
        Locale('tr'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        Locale('ta'),
        Locale('tl'),
        Locale('sv'),
        Locale('da'),
        Locale('ur'),
        Locale('sw'),
        Locale('he'),
        Locale('no'),
        Locale('ro'),
        Locale('hu'),
        Locale('el'),
        Locale('ru'),
        Locale('sk'),
        Locale('am'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(
          interactive: false,
          thickness: MaterialStateProperty.all(4.0),
          radius: Radius.circular(8.0),
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.dragged)) {
              return Color(4285489647);
            }
            if (states.contains(MaterialState.hovered)) {
              return Color(4285489647);
            }
            return Color(4285489647);
          }),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(
          interactive: false,
          thickness: MaterialStateProperty.all(4.0),
          radius: Radius.circular(8.0),
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.dragged)) {
              return Color(4285489647);
            }
            if (states.contains(MaterialState.hovered)) {
              return Color(4285489647);
            }
            return Color(4285489647);
          }),
        ),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
      builder: (_, child) => DynamicLinksHandler(
        router: _router,
        child: child!,
      ),
    );
  }
}
