import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BNCC CSR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyLoginPage(title: 'Login Page'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();

  _onPressed(){
    print('Button Pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return (value!.length < 5) ? "Username must contain atleast 5 letters." : null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter Username',
                  ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else {
                    return (!regex.hasMatch(value)) ? 'Enter valid password' : null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                ),
                onPressed: _onPressed, 
                child: const Text('Login'),
              ))
            ]
          )),
        )
        
      ),
    );
  }
}
