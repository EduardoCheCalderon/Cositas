import 'package:flutter/material.dart';
import 'package:riot_sync/services/firebase_service.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getRegistro(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                String? name = snapshot.data?[index]['name'];
                String? email = snapshot.data?[index]['email'];
                String? password = snapshot.data?[index]['password'];
                String? dob = snapshot.data?[index]['dob'];
                if (name != null &&
                    email != null &&
                    password != null &&
                    dob != null) {
                  return Text('$name $email $password $dob');
                }
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),

      // body: Center(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       _buildHeader(),
      //       const SizedBox(height: 30), // Position 2: Below the header
      //       const Text(
      //         'VPC GAIA#0807',
      //         style: TextStyle(
      //           fontSize: 24,
      //           color: Colors.white,
      //         ),
      //       ), // Position 3: Below the SizedBox
      //       const SizedBox(height: 10), // Position 4: Below the Text
      //       const Text(
      //         'Ausente - Riot Mobile',
      //         style: TextStyle(
      //           fontSize: 18,
      //           color: Colors.white,
      //         ),
      //       ), // Position 5: Below the SizedBox
      //       const SizedBox(height: 30), // Position 6: Below the Text
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Expanded(
      //             child: Container(
      //               height: 80,
      //               decoration: BoxDecoration(
      //                 color: Colors.grey[300],
      //                 borderRadius: BorderRadius.circular(8),
      //               ),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Image.asset('assets/logo_lol.png',
      //                       width: 50,
      //                       height: 50), // Position 7: Inside the Row
      //                   const Text(
      //                       'League of Legends'), // Position 8: Inside the Row
      //                   const SizedBox(width: 10), // Position 9: Inside the Row
      //                   const Text('Bill 78%'), // Position 10: Inside the Row
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ), // Position 11: Below the SizedBox
      //       const SizedBox(height: 20), // Position 12: Below the Row
      //       ElevatedButton(
      //         onPressed: () {}, // Position 13: Below the SizedBox
      //         child: const Text('Visitar el sitio web'),
      //       ), // Position 14: Below the ElevatedButton
      //       const SizedBox(height: 10), // Position 15: Below the ElevatedButton
      //       const Text(
      //         'VALORANT EPISODE ACTI B',
      //         style: TextStyle(
      //           fontSize: 18,
      //           color: Colors.white,
      //         ),
      //       ), // Position 16: Below the SizedBox
      //       const SizedBox(height: 10), // Position 17: Below the Text
      //     ],
      //   ),
      // ),
    );
  }
}

Widget _buildHeader() {
  return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Perfil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ), // Position 1: At the top of the screen
          IconButton(
            onPressed: () {}, // Position 2: At the top of the screen
            icon: const Icon(
              Icons.tune,
              color: Colors.white,
            ),
          ), // Position 3: At the top of the screen
        ],
      ));
}
