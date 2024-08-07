// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

bool isSecured = true;

Map<String , User> users = {
  "jood22396@gmail.com" : User(email:'jood22396@gmail.com',password:'1234'),
 "anas@gmail.com": User(email:'anas@gmail.com', password: 'a123'),
};

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Login Page",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/login.png',
              width: 350,
              height: 350,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      label: Text('Enter Email'),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isSecured,
                    decoration: InputDecoration(
                      label: Text('Enter Password'),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSecured =! isSecured;
                          });
                        },
                      icon: Icon(Icons.remove_red_eye),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                        User user = users[emailController.text]!;
                        
                        if (user.email == emailController.text && user.password == passwordController.text) {
                          print ('logged');
                        }
                        else {
                          print('email or passwored is wrong');
                        }  
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                         color: Colors.blue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                        ],
                      ),
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
}
