import '../flutter_library.dart';

class AlignExemple extends Rview {
  static final String url ="align";
  @override
  Relement build() {
    // TODO: implement build
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Color('#f8f9fa'),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        expand: true,
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Color('#e9ecef'),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Text('Label'),
        ),
      ),
    );
  }
}
