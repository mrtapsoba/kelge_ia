import 'package:flutter/material.dart';

class RecordDetailPage extends StatefulWidget {
  const RecordDetailPage({super.key});

  @override
  State<RecordDetailPage> createState() => _RecordDetailPageState();
}

class _RecordDetailPageState extends State<RecordDetailPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _progressKey = GlobalKey();
  bool _showAppBarControls = false;

  // ✅ Ajouter un booléen pour le mode sélectionné
  bool isPreviewMode = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_checkProgressVisibility);
  }

  void _checkProgressVisibility() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderObject? renderBox =
          _progressKey.currentContext?.findRenderObject();
      if (renderBox is RenderBox) {
        final position = renderBox.localToGlobal(Offset.zero);
        final isVisible = position.dy > kToolbarHeight;
        if (_showAppBarControls == isVisible) {
          setState(() {
            _showAppBarControls = !isVisible;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildControlsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete_forever, color: Colors.red),
        ),
        Text("12:42 / 35:02"),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.history, color: Colors.green[800]),
        ),
        IconButton.filledTonal(
          onPressed: () {},
          icon: Icon(Icons.play_arrow, color: Colors.green[800]),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward, color: Colors.green[800]),
        ),
      ],
    );
  }

  Widget _buildSwitcher() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isPreviewMode = true;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isPreviewMode ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("Aperçu rapide", style: TextStyle(fontSize: 20)),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isPreviewMode = false;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: !isPreviewMode ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("Transcription", style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (isPreviewMode) {
      return Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mots clés",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                Chip(label: Text("Climat"), shape: StadiumBorder()),
                Chip(label: Text("Environnement"), shape: StadiumBorder()),
                Chip(
                  label: Text("Développement durable"),
                  shape: StadiumBorder(),
                ),
                Chip(label: Text("Énergie"), shape: StadiumBorder()),
                Chip(label: Text("Technologie"), shape: StadiumBorder()),
              ],
            ),
            Text(
              "Résumé",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transcription",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry..."
              "\n\nMore text here...",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filledTonal(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.green[800]),
        ),
        title: _showAppBarControls ? _buildControlsRow() : null,
        toolbarHeight: _showAppBarControls ? 80 : kToolbarHeight,
      ),
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        children: [
          const Text(
            "Analyse des defits faces aux climats",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              key: _progressKey,
              children: [
                LinearProgressIndicator(
                  minHeight: 7,
                  value: 0.7,
                  backgroundColor: Colors.green[100],
                  color: Colors.green[800],
                ),
                SizedBox(height: 10),
                _buildControlsRow(),
              ],
            ),
          ),
          SizedBox(height: 10),
          _buildSwitcher(), // ✅ bouton de switch
          SizedBox(height: 20),
          _buildContent(), // ✅ contenu selon sélection
        ],
      ),
    );
  }
}
