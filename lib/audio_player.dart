import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerPage extends StatefulWidget {
  final String filePath;

  const AudioPlayerPage({super.key, required this.filePath});

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _playAudio(widget.filePath);
  }

  void _playAudio(String filePath) {
    audioPlayer.play(DeviceFileSource(filePath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Now Playing:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              widget.filePath,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous page
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
