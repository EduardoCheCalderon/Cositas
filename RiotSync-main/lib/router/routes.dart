import 'package:flutter/material.dart';
import 'package:riot_sync/screen/perfil-screen/perfil.dart';
import '../screen/screens.dart';
import 'package:riot_sync/model/menuOption.dart';

class AppRoutes {
  static const initialRoute = 'choice';

  static final menuOption = <MenuOption>[
    const MenuOption(
        route: 'home', icon: Icons.home, name: 'Home', screen: HomeScreen()),
  ];

  static Map<String, WidgetBuilder> routes = {
    'navbar': (BuildContext context) => const NavBarScreen(),
    'choice': (BuildContext context) => const ChoiceScreen(),
    'login_page': (BuildContext context) => const LoginPage(),
    'register_screen': (BuildContext context) => RegisterScreen(),
    'home_screen': (BuildContext context) => const HomeScreen(),
    'juegos_screen': (BuildContext context) => const JuegosScreen(),
    'perfil_screen': (BuildContext context) => const PerfilScreen(),
    'add_game_screen': (BuildContext context) => AddGameScreen(),
  };
}
