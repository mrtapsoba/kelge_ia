import 'package:flutter/material.dart';
import 'package:kelge_ia/views/auth_page.dart';
import 'package:kelge_ia/views/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: ListView(
          children: <Widget>[
            Text(
              "Kelgé ia",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Transformez\nla parole en savoir",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Une app pensée pour ceux qui veulent aller à l'essentiel",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 250),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AuthPage();
                      },
                    ),
                  );
                },
                child: Text(
                  "Commencer",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
