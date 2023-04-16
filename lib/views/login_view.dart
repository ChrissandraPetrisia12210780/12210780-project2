import 'package:flutter/material.dart';
import 'package:pendataanwarga/views/dashboard_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _JudulFormLogin(),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: _FormLogin(),
                ),
                Center(child: _LogoAplikasi()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _FormLogin extends StatelessWidget {
  const _FormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.grey[300],
      margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
              label: 'Username',
            ),
            InputField(
              label: 'Password',
              obscure: true,
            ),
            _TombolLogin()
          ],
        ),
      ),
    );
  }
}

class _TombolLogin extends StatelessWidget {
  const _TombolLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (bc) {
                return Dashboardview();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Login'),
            )));
  }
}

class InputField extends StatelessWidget {
  final String label;
  final bool obscure;

  const InputField({super.key, this.label = " ", this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(10, 12, 10, 12)),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _LogoAplikasi extends StatelessWidget {
  const _LogoAplikasi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Image.asset(
        'assets/logo.png',
        width: 150,
      ),
    );
  }
}

class _JudulFormLogin extends StatelessWidget {
  const _JudulFormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Text(
          'Aplikasi\nPendataan Warga',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
