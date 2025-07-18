import 'package:flutter/material.dart';
import 'dart:async';

class RecordingPage extends StatefulWidget {
  const RecordingPage({super.key});

  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  late Animation<Alignment> _centerAnimation;

  bool animationStarted = false;
  Duration _recordingDuration = Duration.zero;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _radiusAnimation = Tween<double>(
      begin: 0.85,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _centerAnimation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void startAnimation() {
    if (!animationStarted) {
      _controller.repeat(reverse: true);
      _startTimer();
      setState(() {
        animationStarted = true;
      });
    } else {
      _controller.stop();
      _timer?.cancel();
      setState(() {
        animationStarted = false;
        _recordingDuration = Duration.zero; // reset compteur si besoin
      });
    }
  }

  void _startTimer() {
    _timer?.cancel(); // Annule un éventuel ancien timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _recordingDuration += const Duration(seconds: 1);
      });
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filledTonal(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.green[800]),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Text(
            "Nouvel\nEnregistrement",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final scale = 1 + 0.1 * _controller.value;
              final opacity = 0.5 + 0.5 * (1 - _controller.value);

              return Center(
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        center: _centerAnimation.value,
                        radius: _radiusAnimation.value,
                        colors: [Colors.green, Colors.white],
                        stops: const [0.0, 1.0],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(opacity),
                          blurRadius: 30 * _controller.value,
                          spreadRadius: 15 * _controller.value,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.record_voice_over_outlined,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          Text(
            formatDuration(_recordingDuration),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            "Appuyez sur le bouton ci-dessus pour démarrer l'enregistrement.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          !animationStarted
              ? GestureDetector(
                onTap: startAnimation,
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green, width: 5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton.filledTonal(
                    highlightColor: Colors.white,
                    iconSize: 50,
                    onPressed: () {},
                    icon: Icon(Icons.pause_rounded, color: Colors.grey[600]),
                  ),
                  GestureDetector(
                    onTap: startAnimation,
                    child: Container(
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.stop_rounded,
                        size: 75,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  IconButton.filledTonal(
                    highlightColor: Colors.white,
                    iconSize: 50,
                    onPressed: startAnimation,
                    icon: const Icon(Icons.close_rounded, color: Colors.red),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
