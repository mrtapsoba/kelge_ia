import 'package:flutter/material.dart';
import 'package:kelge_ia/views/home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true; // ✅ Switch entre connexion et inscription

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filledTonal(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.green[800]),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        children: [
          Text(
            isLogin ? "Connexion" : "Inscription", // ✅ Titre dynamique
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // ✅ Boutons Connexion / Inscription
          Container(
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => setState(() => isLogin = true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isLogin ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Connexion", style: TextStyle(fontSize: 18)),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => isLogin = false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: !isLogin ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Inscription", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isLogin) ...[
                  Text(
                    "Nom complet",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Entrez votre nom",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
                Text(
                  "Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Entrez votre email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Mot de passe",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Entrez votre mot de passe",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (!isLogin) ...[
                  Text(
                    "Mot de passe de confirmation",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Entrez à nouveau votre mot de passe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  },
                  child: Text(
                    isLogin ? "Se connecter" : "S'inscrire",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isLogin)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(fontSize: 16, color: Colors.green[800]),
                      textAlign: TextAlign.end,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "ou",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.mail, color: Colors.green[800]),
              title: Text(
                "Continuer avec Google",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.phone_android, color: Colors.black),
              title: Text(
                "Continuer avec Phone",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
