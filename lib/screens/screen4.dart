import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Screen4 extends StatelessWidget {
  final List<String> soundPaths = [
    'assets/proyecto_entorno/amarillo.mp3',
    'assets/proyecto_entorno/anaranjado.mp3',
    'assets/proyecto_entorno/azul.mp3',
    'assets/proyecto_entorno/rojo.mp3',
    'assets/proyecto_entorno/cafe.mp3',
    'assets/proyecto_entorno/morado.mp3',
    'assets/proyecto_entorno/negro.mp3',
    'assets/proyecto_entorno/verde.mp3',
    'assets/proyecto_entorno/rosa.mp3',
    'assets/proyecto_entorno/blanco.mp3',
  ];

  final List<String> imagePaths = [
    'assets/proyecto_entorno/amarillo.png',
    'assets/proyecto_entorno/anaranjado.png',
    'assets/proyecto_entorno/azul.png',
    'assets/proyecto_entorno/rojo.png',
    'assets/proyecto_entorno/cafe.png',
    'assets/proyecto_entorno/morado.png',
    'assets/proyecto_entorno/negro.png',
    'assets/proyecto_entorno/verde.png',
    'assets/proyecto_entorno/rosa.png',
    'assets/proyecto_entorno/blanco.png',
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
        height: 60.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
