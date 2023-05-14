import 'package:classtest/model/user.dart';
import 'package:classtest/myapp.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final List<User> users;

  const LoginPage({super.key, required this.users});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  var gap = const SizedBox(height: 10);
  final bankloginkey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: bankloginkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Email ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return (" required");
                    }
                    return null;
                  },
                ),
                gap,
                TextFormField(
                  controller: passwordcontroller,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Password ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return (" required");
                    }
                    return null;
                  },
                ),
                gap,
                ElevatedButton(
                  onPressed: () {
                    for (var user in allUsers) {
                      print(user.email);
                      if (user.email == emailcontroller.text &&
                          user.password == passwordcontroller.text) {
                        Navigator.pushNamed(
                          context,
                          '/dashboard',
                          arguments: user,
                        );

                        return;
                      }
                    }
                    print("error");
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 45)),
                  child: const Text("Login"),
                ),
                gap,
                // signup button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text("Signup"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
