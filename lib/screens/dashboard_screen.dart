import 'package:flutter/material.dart';
import 'dart:async';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_1/firebase/email_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_1/models/user_model.dart';
import 'package:flutter_1/provider/theme_provider.dart';
import 'package:flutter_1/screens/list_post.dart';
import 'package:flutter_1/settings/styles_settings.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../firebase/google_auth.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  bool isDarkModeEnabled = false;
  bool _showImage = false;
  EmailAuth emailAuth = EmailAuth();
  GoogleAuth googleAuth = GoogleAuth();
  UserModel? datosUsuario;
  String? user;
  bool isLoggedIn = false;
  bool isLoggedInFB = false;
  bool isLoggedInGG = false;

  void checkIfIsLoggedFB() async {
    final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
    isLoggedIn = accessToken != null;
    isLoggedInFB = isLoggedIn;
    //print('isLoggedIn: $isLoggedIn');
  }

  void checkIfIsLoggedGG() async {
    isLoggedIn = await _googleSignIn.isSignedIn();
    isLoggedInGG = isLoggedIn;
    //print('isLoggedIn: $isLoggedIn');
  }

  @override
  void initState() {
    super.initState();
    checkIfIsLoggedFB();
    checkIfIsLoggedGG();
  }

  final spaceHoriz = const SizedBox(
    height: 7,
  );

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    /* if (isLoggedInFB == true) {
      print(':(');
    } else {
      User? userfb;
      user = userfb?.displayName;
      print('Te encuentras logeado con Facebook y este es tu usuario: $user');
    } */
    if (ModalRoute.of(context)!.settings.arguments != null) {
      datosUsuario = ModalRoute.of(context)!.settings.arguments as UserModel;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios BMW'),
      ),
      body: const ListPost(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: "btn1",
            onPressed: () {
              Navigator.pushNamed(context, '/add').then((value) {
                setState(() {});
              });
            },
            label: const Text('Add post'),
            icon: const Icon(Icons.add_comment),
          ),
          spaceHoriz,
          FloatingActionButton.extended(
            heroTag: "btn2",
            onPressed: () {
              Navigator.pushNamed(context, '/events').then((value) {
                setState(() {});
              });
            },
            label: const Text('Eventos'),
            icon: const Icon(Icons.calendar_month),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: const CircleAvatar(
                  //backgroundImage: NetworkImage(datosUsuario!.photoUrl.toString()),
                  backgroundImage: NetworkImage(
                      'https://st3.depositphotos.com/1004920/12992/v/950/depositphotos_129925354-stock-illustration-head-of-lynx-isolated-on.jpg'),
                ),
                accountName: Text('Ricardo Estrada'),
                accountEmail: Text('your_email@gmail.com')),
            ListTile(
              onTap: () {},
              title: const Text('Pago de servicios'),
              subtitle: const Text('Desgloce de mis servicios'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/popular'),
              title: const Text('API MOVIES'),
              leading: const Icon(Icons.movie),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/best'),
              title: const Text('THE BEST MOVIES'),
              leading: const Icon(Icons.star),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/gif'),
              title: const Text('GHIPS'),
              leading: const Icon(Icons.gif_box_sharp),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/maps'),
              title: const Text('MAPS'),
              leading: const Icon(Icons.location_on),
              trailing: const Icon(Icons.chevron_right),
            ),
            DayNightSwitcher(
              isDarkModeEnabled: isDarkModeEnabled,
              onStateChanged: (isDarkModeEnabled) {
                isDarkModeEnabled
                    ? theme.setthemeData(StylesSettings.darkTheme(context))
                    : theme.setthemeData(StylesSettings.lightTheme(context));
                this.isDarkModeEnabled = isDarkModeEnabled;
                setState(() {});
              },
            ),
            ListTile(
                onTap: () {
                  setState(() {
                    _showImage = true;
                  });
                  Timer(const Duration(seconds: 5), () {
                    setState(() {
                      _showImage = false;
                      Navigator.pushNamed(context, '/main');
                    });
                  });
                },
                title: const Text('Cerrar sesión'),
                leading: const Icon(Icons.logout)),
            if (_showImage)
              Image.network(
                'https://pa1.narvii.com/6514/bfa57b69f59d94ae868ae1914d9e5bbbdc8814cd_hq.gif',
              ),
          ],
        ),
      ),
    );
  }
}
