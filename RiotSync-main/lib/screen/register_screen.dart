import 'package:flutter/material.dart';
import 'package:riot_sync/screen/custom_clipper.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController dobController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    dobController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
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
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height,
                      width: double.infinity,
                      child: _buildInputFields(),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputFields() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Text(
            "Registrarse",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 20),
          _buildTextField(
              nameController, Icons.person_outline, "Nombre de usuario"),
          const SizedBox(height: 20),
          _buildTextField(emailController, Icons.mail_outline, "Email"),
          const SizedBox(height: 20),
          _buildTextField(
              passwordController, Icons.password_outlined, "Contraseña",
              isPassword: true),
          const SizedBox(height: 20),
          _buildDateField(dobController),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: _validateAndSubmit,
            child: const Text("Registrarse"),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'login_page');
            },
            child: const Text(
              "Ya tengo una cuenta",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 20), // Agrega un espacio adicional aquí
          _buildSocialLogins(),
        ],
      ),
    );
  }

  Widget _buildSocialLogins() {
    return Column(
      children: [
        const Text(
          "O regístrate con",
          style: TextStyle(color: Colors.white70, fontSize: 17),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/gugul.png',
                  height: 40), // Cambia el icono a una imagen
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTextField(
      TextEditingController controller, IconData icon, String hint,
      {bool isPassword = false}) {
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
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildDateField(TextEditingController controller) {
    return FormBuilderDateTimePicker(
      name: 'dob',
      controller: controller,
      format: DateFormat('yyyy-MM-dd'),
      initialDate: DateTime.now(),
      inputType: InputType.date,
      decoration: InputDecoration(
        labelText: 'Fecha de Nacimiento',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          Icons.calendar_today,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
      validator: (value) {
        if (value == null) {
          return 'Selecciona tu fecha de nacimiento';
        }
        return null;
      },
    );
  }

  void _validateAndSubmit() {
    final form = FormBuilder.of(context);
    if (form != null && form.saveAndValidate()) {
      // Tu lógica para procesar la información del formulario
      print("Formulario válido. Procesando datos...");
    }
  }
}
