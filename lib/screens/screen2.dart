import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Screen2 extends StatelessWidget {
  final List<String> soundPaths = [
    'assets/proyecto_entorno/1.m4a',
    'assets/proyecto_entorno/2.m4a',
    'assets/proyecto_entorno/3.m4a',
    'assets/proyecto_entorno/4.m4a',
    'assets/proyecto_entorno/5.m4a',
    'assets/proyecto_entorno/6.m4a',
    'assets/proyecto_entorno/7.m4a',
    'assets/proyecto_entorno/8.m4a',
    'assets/proyecto_entorno/9.m4a',
    'assets/proyecto_entorno/10.m4a',
  ];

  final List<String> imagePaths = [
    'assets/proyecto_entorno/1.jpg',
    'assets/proyecto_entorno/2.jpg',
    'assets/proyecto_entorno/3.jpg',
    'assets/proyecto_entorno/4.jpg',
    'assets/proyecto_entorno/5.jpg',
    'assets/proyecto_entorno/6.jpg',
    'assets/proyecto_entorno/7.jpg',
    'assets/proyecto_entorno/8.jpg',
    'assets/proyecto_entorno/9.jpg',
    'assets/proyecto_entorno/10.jpg',
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
                // Primera columna de botones
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      SoundButton(
                        soundPath: soundPaths[i],
                        imagePath: imagePaths[i],
                        onPressed: () => _playSound(soundPaths[i]),
                      ),
                  ],
                ),
                // Segunda columna de botones
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 5; i < 10; i++)
                      SoundButton(
                        soundPath: soundPaths[i],
                        imagePath: imagePaths[i],
                        onPressed: () => _playSound(soundPaths[i]),
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
        width: 55.0,
        height: 55.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
