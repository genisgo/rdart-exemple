import '../flutter_library.dart';

class ContenairTest extends Rview {
  static const String url = "/contenair";
  final boxContainer = Container(
    padding: EdgeInsets.all(16),
    decoration: const BoxDecoration(color: Colors.red),
    child: Column(
      children: [
        // … tes éléments
      ],
    ),
  );

  final cardContainer = Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    decoration: BoxDecoration(
      color: MaterialColor.fromHex('#ffffff'),
      borderRadius: BorderRadius.all(const Radius.circular(12)),
      border: Border(
        all: BorderSide(width: 1, color: MaterialColor(0, 0, 0, .08)),
      ),
      boxShadow: const [
        BoxShadow(
          offsetX: 0,
          offsetY: 8,
          blurRadius: 5,
          color: 'rgba(0,0,0,.10)',
        ),
      ],
    ),
    clip: true,
    child: Column(
      gap: 8,
      children: [
        // ...
      ],
    ),
  );

  final heroContainer = Container(
    height: 240,
    constraints: const BoxConstraints(minWidth: 300, maxWidth: 1200),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          MaterialColor.fromHex('#845ef7'),
          MaterialColor.fromHex('#5c7cfa'),
          MaterialColor.fromHex('#4dabf7'),
        ],
        stops: [0.0, 0.5, 1.0],
        angleDeg: 135,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
    ),
    child: Container(
      // un "chip" centré dans le hero
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: MaterialColor.fromHex('rgba(255,255,255,.9)'),
        borderRadius: BorderRadius.all(const Radius.circular(999)),
      ),
      child: Text('Bienvenue 👋'), // suppose un Relement texte simple
    ),
  );

  final banner = Container(
    height: 400,
    width: 300,
    decoration: const BoxDecoration(
      backgroundImageUrl: 'assets/banner.PNG',
      backgroundSize: BackgroundSize.cover,
      backgroundPosition: BackgroundPosition.center,
    ),
    clip: true,
    child: Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      decoration: const BoxDecoration(
        // overlay sombre léger par-dessus l'image
        gradient: LinearGradient(
          colors: [MaterialColor(0, 0, 0, .25), MaterialColor(0, 0, 0, 0)],
          angleDeg: 0,
        ),
      ),
      child: Text('Banner'),
    ),
  );

  @override
  Relement build() {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(title: Text("Les Container")),
      body: Column(
        children: [
          Text("Box Container"),
          boxContainer,
          Text("Card"),
          cardContainer,
          Text("Hero Container"),
          heroContainer,
          Text("Banner Container"),
          banner,
        ],
      ),
    );
  }
}
