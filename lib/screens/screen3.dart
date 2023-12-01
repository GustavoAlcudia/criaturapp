import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Screen3 extends StatelessWidget {
  final List<String> soundPaths = [
    'assets/proyecto_entorno/ma.mp3',
    'assets/proyecto_entorno/me.mp3',
    'assets/proyecto_entorno/mi.mp3',
    'assets/proyecto_entorno/mo.mp3',
    'assets/proyecto_entorno/mu.mp3',
    'assets/proyecto_entorno/pa.mp3',
    'assets/proyecto_entorno/pe.mp3',
    'assets/proyecto_entorno/pi.mp3',
    'assets/proyecto_entorno/po.mp3',
    'assets/proyecto_entorno/pu.mp3',
    'assets/proyecto_entorno/la.m4a',
    'assets/proyecto_entorno/le.m4a',
    'assets/proyecto_entorno/li.m4a',
    'assets/proyecto_entorno/lo.m4a',
    'assets/proyecto_entorno/lu.m4a',
    'assets/proyecto_entorno/sa.m4a',
    'assets/proyecto_entorno/se.m4a',
    'assets/proyecto_entorno/si.m4a',
    'assets/proyecto_entorno/so.m4a',
    'assets/proyecto_entorno/su.m4a',
  ];

  final List<String> imagePaths = [
    'assets/proyecto_entorno/ma.jpg',
    'assets/proyecto_entorno/me.jpg',
    'assets/proyecto_entorno/mi.jpg',
    'assets/proyecto_entorno/mo.jpg',
    'assets/proyecto_entorno/mu.jpg',
    'assets/proyecto_entorno/pa.jpg',
    'assets/proyecto_entorno/pe.jpg',
    'assets/proyecto_entorno/pi.jpg',
    'assets/proyecto_entorno/po.jpg',
    'assets/proyecto_entorno/pu.jpg',
    'assets/proyecto_entorno/la.jpg',
    'assets/proyecto_entorno/le.jpg',
    'assets/proyecto_entorno/li.jpg',
    'assets/proyecto_entorno/lo.jpg',
    'assets/proyecto_entorno/lu.jpg',
    'assets/proyecto_entorno/sa.jpg',
    'assets/proyecto_entorno/se.jpg',
    'assets/proyecto_entorno/si.jpg',
    'assets/proyecto_entorno/so.jpg',
    'assets/proyecto_entorno/su.jpg',
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Números'),
      ),
      body: Stack(
        children: [
          // Fondo de la pantalla
          Image.asset(
            'assets/proyecto_entorno/fondoapp.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Contenido de la pantalla
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int j = i * 5; j < (i + 1) * 5; j++)
                        SoundButton(
                          soundPath: soundPaths[j],
                          imagePath: imagePaths[j],
                          onPressed: () => _playSound(soundPaths[j]),
                        ),
                    ],
                  ),
                // Botón para regresar al menú
                ElevatedButton(
                  onPressed: () {
                    // Regresar al menú
                    Navigator.pop(context);
                  },
                  child: const Text('Regresar al Menú'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _playSound(String soundPath) async {
    await _audioPlayer.play(soundPath, isLocal: true);
  }
}

class SoundButton extends StatelessWidget {
  final String soundPath;
  final String imagePath;
  final VoidCallback onPressed;

  const SoundButton({
    required this.soundPath,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        imagePath,
        width: 20.0,
        height: 70.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
