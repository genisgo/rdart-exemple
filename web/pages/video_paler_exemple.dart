import '../flutter_library.dart';

class VideoPalerExemple extends Rview {
  static final String url = "videoPlayer";
  VideoPlayer? player;
  @override
  void initState() {
    analytic(player!);
    super.initState();
  }

  @override
  Relement build() {
    // ------------------------ Démo ------------------------
    player = _getPlayer();
    // final playerPlus = VideoPlayerPlus(
    //   sources: const [
    //     VideoSource(
    //       url:
    //           'https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4',
    //       label: '720p',
    //       type: 'video/mp4',
    //       height: 720,
    //     ),
    //     // Exemple HLS (si natif):
    //     // VideoSource(url: 'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8', label:'HLS', type:'application/vnd.apple.mpegurl'),
    //   ],
    //   captions: const [
    //     CaptionTrack(
    //       src:
    //           'https://raw.githubusercontent.com/mdn/learning-area/main/html/multimedia-and-embedding/video-and-audio-content/subtitles.vtt',
    //       srclang: 'en',
    //       label: 'English',
    //       isDefault: true,
    //     ),
    //   ],
    //   thumbs: const ThumbnailSpriteConfig(
    //     url:
    //         'https://raw.githubusercontent.com/streamroot/adaptive-streaming-player-samples/master/thumbnails/thumbnails.jpg',
    //     tileWidth: 160,
    //     tileHeight: 90,
    //     columns: 10,
    //     stepSec: 5,
    //   ),
    //   poster: 'https://picsum.photos/id/1015/1200/675',
    //   allowDownload: false,
    //   allowPiP: true,
    //   initialVolume: .9,
    //   initialSpeed: 1.0,
    // );

    // TODO: implement build

    return Scaffold(
      appBar: AppBar(title: "Lecteur de video Exemple"),
      body: Column(
        children: [
          Text("Leuteur Video"),
          SizedBox(height: 20),
          player!,
          SizedBox(height: 20),
          Text("Lecteur video Plus"),
          // playerPlus
        ],
      ),
    );
  }

  VideoPlayer _getPlayer() {
    return VideoPlayer(
      sources: const [
        VideoSource(
          url:
              'https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4',
          label: '720p',
          type: 'video/mp4',
          height: 720,
        ),
        // vous pouvez ajouter d'autres qualités/urls ici
      ],
      captions: const [
        CaptionTrack(
          src:
              'https://raw.githubusercontent.com/mdn/learning-area/main/html/multimedia-and-embedding/video-and-audio-content/subtitles.vtt',
          srclang: 'en',
          label: 'English',
          isDefault: true,
        ),
      ],
      // poster: 'https://picsum.photos/id/1015/1200/675',
      autoplay: false,
      loop: false,
      muted: false,
      allowDownload: false,
      allowPiP: true,
      initialVolume: .9,
      initialSpeed: 1.0,
    );
  }

  Future analytic(VideoPlayer player) async {
    // Démarre l’analytics
     final meta = await player.waitForMetadata();
    player.startAnalytics(
      tick: const Duration(seconds: 1),
      onTick: (p) {
        // p.current, p.duration, p.percent, p.buffered, p.playbackRate, p.paused
        print('${(p.percent * 100).toStringAsFixed(1)}%');
      },
      onPause: () {
        print('pause');
      },
      onResume: () {
        print('resume');
      },
      onQuartile: (q) {
        print('quartile atteint: $q%');
      },
    );

    // Métadonnées (immédiat)
    final metaNow = player.getMetadata();
    print("MetaNow ${metaNow.duration}");
    // Métadonnées (attend loadedmetadata si pas encore prêt)
   
    print("Meta: ${meta.mimeType}");
    // Résumé courant
    final sum = player
        .getAnalyticsSummary(); // pauses/resumes/watched/quartiles
    print(sum.pauses);
    // Stopper
    player.stopAnalytics();
  }
}
