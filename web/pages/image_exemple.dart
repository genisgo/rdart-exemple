import '../flutter_library.dart';

class ImageExemple extends Rview {
  static final String url = "images";
  @override
  Relement build() {
    // TODO: implement build
    final card = Container(
      width: 280,
      height: 160,
      decoration: BoxDecoration(
        color: MaterialColor.fromHex('#0b1220'),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        backgroundImageUrl: 'https://picsum.photos/id/64/800/600',
        backgroundSize: BackgroundSize.cover,
        backgroundPosition: BackgroundPosition.center,
        backgroundRepeat: BackgroundRepeat.noRepeat,
      ),
    );

    // Motif qui se répète horizontalement, positionné en haut-gauche
    final stripe = Container(
      width: 400,
      height: 120,
      decoration: BoxDecoration(
        color:Color( '#111827'),
        borderRadius: BorderRadius.all(Radius.circular(12)),
        backgroundImageUrl: '/assets/test_image.jpg',
        backgroundSize: BackgroundSize.contain,
        backgroundPosition: BackgroundPosition.topLeft,
        backgroundRepeat: BackgroundRepeat.repeatX,
      ),
    );

    final sizedBox = SizedBox(height: 20);
    return Scaffold(
      appBar: AppBar(title: Text("Image Exemple")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            card,
            SizedBox(height: 20),
            stripe,

            sizedBox,
            Text("Image réseau avec placeholder simple et coin arrondi"),
            Image.network(
              'https://picsum.photos/id/1027/600/400',
              width: 280,
              height: 180,
              fit: BoxFit.cover,
              borderRadius: 16,
              placeholder: Container(
                decoration: BoxDecoration(
                  color: Color('#e5e7eb'),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Center(
                  child: Text(
                    'Chargement...',
                    color: MaterialColor.fromHex('#6b7280'),
                  ),
                ),
              ),
            ),
            sizedBox,
            Text("FadeInImage : skeleton → image"),
            FadeInImage(
              placeholder: Container(
                width: 280,
                height: 180,
                decoration: BoxDecoration(
                  color: Color('#f3f4f6'),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              imageUrl: 'https://picsum.photos/id/64/600/400',
              width: 280,
              height: 180,
              fit: BoxFit.cover,
              durationMs: 240,
            ),
            sizedBox,
            Text("CircleAvatar avec initiales"),
            CircleAvatar(initials: 'AG', radius: 28),
            sizedBox,
            CircleAvatar(
              imageUrl: 'https://picsum.photos/id/237/200/200',
              radius: 28,
            ),
          ],
        ),
      ),
    );
  }

  //   void demoImages() {
  //     // 1) Image réseau avec placeholder simple et coin arrondi
  //     var borderRadius = BorderRadius.all(Radius.circular(16));
  //     final img1 = Image.network(
  //       'https://picsum.photos/id/1027/600/400',
  //       width: 280,
  //       height: 180,
  //       fit: BoxFit.cover,
  //       borderRadius: 16,
  //       placeholder: Container(
  //         decoration: BoxDecoration(color: '#e5e7eb', borderRadius: borderRadius),
  //         child: Center(
  //           child: Text('Chargement...', color: MaterialColor.fromHex('#6b7280')),
  //         ),
  //       ),
  //     );

  //     // 2) FadeInImage : skeleton → image
  //     final fade = FadeInImage(
  //       placeholder: Container(
  //         width: 280,
  //         height: 180,
  //         decoration: BoxDecoration(color: '#f3f4f6', borderRadius: borderRadius),
  //       ),
  //       imageUrl: 'https://picsum.photos/id/64/600/400',
  //       width: 280,
  //       height: 180,
  //       fit: BoxFit.cover,
  //       durationMs: 240,
  //     ).create();

  //     // 3) CircleAvatar avec initiales
  //     final av1 = CircleAvatar(initials: 'AG', radius: 28);

  //     // 4) CircleAvatar avec image
  //     CircleAvatar(imageUrl: 'https://picsum.photos/id/237/200/200', radius: 28);
  //   }
  //
}
