import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller =
        VideoPlayerController.asset('assets/proyecto_entorno/abcd.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('abecedario'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Si el controlador de video se ha inicializado correctamente
            return Stack(
              children: [
                // Fondo de la pantalla
                Image.asset(
                  'assets/proyecto_entorno/fondoapp.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                // Contenido de la pantalla
                buildVideoPlayer(),
              ],
            );
          } else {
            // Mientras el controlador se está inicializando, muestra un indicador de carga
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildVideoPlayer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio ?? 16 / 9,
              child: VideoPlayer(_controller),
            ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _controller.seekTo(Duration.zero);
              Navigator.pop(context); // Regresar al menú
            },
            child: const Text('Regresar al Menú'),
          ),
        ],
      ),
    );
  }
}
