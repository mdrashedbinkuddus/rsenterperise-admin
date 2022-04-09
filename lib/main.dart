import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:rafia_enterprise/sign_in/sign_in_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page/home_page_widget.dart';
import 'party_list/party_list_widget.dart';
import 'payments/payments_widget.dart';
import 'costs/costs_widget.dart';
import 'shipment/shipment_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = ThemeMode.system;
  Stream<RafiaEnterpriseFirebaseUser> userStream;
  RafiaEnterpriseFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  void initState() {
    super.initState();
    userStream = rafiaEnterpriseFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rafia Enterprise',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Container(
              color: FlutterFlowTheme.of(context).primaryColor,
              child: Center(
                child: Builder(
                  builder: (context) => Image.asset(
                    'assets/images/rafia-enterprise.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : SignInWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'PartyList': PartyListWidget(),
      'Payments': PaymentsWidget(),
      'Costs': CostsWidget(),
      'Shipment': ShipmentWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0x8A000000),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard_sharp,
              size: 26,
            ),
            label: 'Dashboard',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_sharp,
              size: 26,
            ),
            label: 'Party',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money_rounded,
              size: 26,
            ),
            label: 'Payment',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money_rounded,
              size: 26,
            ),
            label: 'Costs',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.flight_takeoff_rounded,
              size: 26,
            ),
            label: 'Shipment',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
