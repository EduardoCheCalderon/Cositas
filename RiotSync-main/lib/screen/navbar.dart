import 'package:flutter/material.dart';

class NavBarScreen extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NavBarScreen(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'Noticias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.games),
          label: 'Juegos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Mi Perfil',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 1) {
          Navigator.pushNamed(context, 'juegos_screen');
        } else if (index == 2) {
          // Navegar a la pantalla de mi perfil
        }
      },
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      backgroundColor: Colors.black,
    );
  }
}
