import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:managestate/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Authprovider = Provider.of<Authentication>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(hintText: 'password'),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Authprovider.login(emailcontroller.text.toString(),
                    passwordcontroller.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Authprovider.loading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
