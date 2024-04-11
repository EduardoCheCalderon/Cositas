import 'package:flutter/material.dart';
import 'package:riot_sync/screen/juegos-screen/juegos_screen.dart';
import 'package:riot_sync/screen/perfil-screen/perfil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _backButtonCounter = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex > 0) {
          _backButtonCounter++;
          if (_backButtonCounter == 0) {
            _backButtonCounter = 0;
            setState(() {
              _selectedIndex--;
            });
            return false;
          }
          return false;
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildNewsCard(
                      'El deseo de un príncipe | Cinemática Deleite Lunar 2024',
                      'League of Legends',
                      'assets/deseo.png',
                      '7 Feb 2024'),
                  const SizedBox(height: 10),
                  _buildArticle('ASÍ LO JUEGO: Pro tips para jugar el Outlaw',
                      'assets/asi_lo_juego_outlaw.png'),
                ],
              ),
            ),
            const JuegosScreen(),
            const PerfilScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 35, 35, 35),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Noticias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.games),
              label: 'Juegos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 0,
          enableFeedback: false,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          iconSize: 30,
          selectedIconTheme: const IconThemeData(size: 30),
          unselectedIconTheme: const IconThemeData(size: 24),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Noticias',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(
      String title, String subtitle, String imageAsset, String date) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[850],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageAsset,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticle(String title, String imageAsset) {
    return Row(
      children: [
        Image.asset(
          imageAsset,
          width: 64,
          height: 64,
          fit: BoxFit.cover,
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'ASÍ LO JUEGO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
