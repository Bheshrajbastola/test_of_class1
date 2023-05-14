import 'package:classtest/model/user.dart';
import 'package:classtest/myapp.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final List<User> users;
  const SignupPage({super.key, required this.users});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  var gap = const SizedBox(height: 10);
  final bankkey = GlobalKey<FormState>();

  //databasesas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: bankkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: firstnamecontroller,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "First Name ",
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
                  controller: lastnamecontroller,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Last Name ",
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
                  controller: addresscontroller,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Address",
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
                  controller: phonecontroller,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Phone Number ",
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

                // On successful validation, add the new user to the users list
                ElevatedButton(
                  onPressed: () {
                    if (bankkey.currentState!.validate()) {
                      // Create the new user
                      User newUser = User(
                        firstName: firstnamecontroller.text,
                        lastName: lastnamecontroller.text,
                        email: emailcontroller.text,
                        address: addresscontroller.text,
                        phoneNumber: phonecontroller.text,
                        password: passwordcontroller.text,
                        accountNo: '${allUsers.length + 1}',
                      );
                      // Add the new user to the list
                      allUsers.add(newUser);
                      print(allUsers);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("User added successfully"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pushNamed(context, '/');
                    } else {
                      print("Not validated");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 45)),
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
