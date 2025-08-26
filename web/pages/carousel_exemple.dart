import '../flutter_library.dart';

class CarouselExemple extends Rview {
  static final String url = "carousel";
  @override
  Relement build() {
    // TODO: implement build
    final pc = PageController();
    final pv = PageView(
      controller: pc,
      viewportFraction: 1,
      loop: true,
      autoplay: true,
      autoplayIntervalMs: 2600,
      showIndicator: true,
      children: [
        _DemoCard('Casque Nova', 'https://picsum.photos/id/180/1200/675'),
        _DemoCard('Lampe Halo', 'https://picsum.photos/id/1062/1200/675'),
        _DemoCard('Montre Air', 'https://picsum.photos/id/111/1200/675'),
      ],
      onPageChanged: (i) {
        /* print('page: $i'); */
      },
    );
    var sizedBox = SizedBox(height: 40, shrink: true);
    return Scaffold(
      appBar: AppBar(title:Text( "Carousel Exemple")),
      body: Column(
        bootstrap: [bwidth.x100],
        children: [
          Text("Carousel Exemple"),
          sizedBox,
          Container(height: 500, child: pv, bootstrap: [bwidth.x100.cname]),
          SizedBox(height: 40, shrink: true),
          MaterialButton(
            label: "Next",
            icon: BsIcon(icon: Bicon.arrowRight),
            iconPosition: IconPosition.trailing,
            onPressed: () {
              pc.nextPage();
            },
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Démo rapide
// -----------------------------------------------------------------------------
class _DemoCard extends Rview {
  final String title;
  final String img;
  _DemoCard(this.title, this.img);
  @override
  build() {
    var borderRadius = BorderRadius.all(Radius.circular(16));
    return Container(
      // width: 500,
      height: 500,

      decoration: BoxDecoration(
        borderRadius: borderRadius,
        backgroundImageUrl: img,
        backgroundSize: BackgroundSize.cover,
        backgroundPosition: BackgroundPosition.center,
      ),
      child: Container(
        bootstrap: [bheight.x100.cname],
        // width: 400,
        decoration: BoxDecoration(
          color: Color(
            "linear-gradient(180deg, rgba(0,0,0,0) 0%, rgba(0,0,0,.5) 100%)",
          ),
          borderRadius: borderRadius,
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  title,

                  fontSize: 18,
                  fontWeight: FontWeightCss.w800,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
