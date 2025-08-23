import '../flutter_library.dart';

class StackExemple extends Rview {
  static final String url = "stack";
  @override
  Relement build() {
    // TODO: implement build
    return Container(
      height: 400,
      child: Stack(
        clip: true,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color('#e7f5ff'),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
            ),
            height: 160,
            width: 160,
            child: Text("Test"),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: Card(child: Text('Badge'), padding: EdgeInsets.all(8)),
          ),
          Positioned(
            bottom: 0,
            left: 12,
            child: Card(
              child: Text('Badge'),
              padding: EdgeInsets.all(8),
              style: RStyle(background: MaterialColor(120, 120, 62)),
            ),
          ),
          // Un enfant non-positionné centré
          Text('Titre', fontSize: 24, fontWeight: FontWeightCss.w700),
        ],
      ),
    );
  }
}
