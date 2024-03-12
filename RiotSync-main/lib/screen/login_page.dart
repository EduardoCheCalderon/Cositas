import 'package:flutter/material.dart';
import 'custom_clipper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController nameController;
  late TextEditingController passwordController;
  bool nameError = false;
  bool passwordError = false;

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            child: _buildInputFields(),
          ),
          _buildSocialLogins(),
        ]),
      ),
    );
  }

  Widget _buildInputFields() {
    return ClipPath(
      clipper: CustomClipperWidget(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Color.fromARGB(155, 180, 0, 0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                "Iniciar sesión",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 60),
              _buildTextField(
                nameController,
                Icons.person_outline,
                "Nombre de usuario",
                error: nameError,
              ),
              if (nameError)
                const Text('Por favor, ingresa tu nombre de usuario.',
                    style: TextStyle(color: Colors.black)),
              const SizedBox(height: 20),
              _buildTextField(
                passwordController,
                Icons.info_outline,
                "Contraseña",
                isPassword: true,
                error: passwordError,
              ),
              if (passwordError)
                const Text('Por favor, ingresa tu contraseña.',
                    style: TextStyle(color: Colors.black)),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _validateFields,
                child: const Text("Iniciar sesión"),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Olvidé mi contraseña",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLogins() {
    return Column(
      children: [
        const Text(
          "O inicia sesión con",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/gugul.png'),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTextField(
      TextEditingController controller, IconData icon, String hint,
      {bool isPassword = false, bool error = false}) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      obscureText: isPassword,
      onChanged: (_) {
        if (error) {
          setState(() {
            if (controller == nameController) {
              nameError = false;
            } else if (controller == passwordController) {
              passwordError = false;
            }
          });
        }
      },
    );
  }

  void _validateFields() {
    setState(() {
      nameError = nameController.text.isEmpty;
      passwordError = passwordController.text.isEmpty;
    });

    if (!nameError && !passwordError) {
      Navigator.pushNamed(context, 'home_screen');
    }
  }
}
