import 'package:flutter/material.dart';
import 'package:kelge_ia/views/record_detail_page.dart';
import 'package:kelge_ia/views/recording_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filledTonal(
          onPressed: () {},
          icon: Icon(Icons.more_horiz, color: Colors.green[800]),
        ),
        title: Text(
          "Kelgé IA",
          style: TextStyle(
            color: Colors.green[800],
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.mic_none_outlined,
                size: 30,
                color: Colors.green[800],
              ),
              title: Text(
                "Nouvel enregistrement",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RecordingPage();
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            ListTile(
              title: Text(
                "Mes enregistrements",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Rechercher un enregistrement",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with your data length
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: IconButton.filledTonal(
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow, color: Colors.green[800]),
                    ),
                    title: Text("Enregistrement ${index + 1}"),
                    subtitle: Text("Durée : 2 min 30 sec"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Date: 2023-10-01"),
                        SizedBox(width: 10),
                        Badge(smallSize: 10),
                      ],
                    ),
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecordDetailPage(),
                          ),
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
