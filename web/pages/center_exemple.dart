import '../flutter_library.dart';

class CenterExemple extends Rview {
  static final String url = "center";
  @override
  Relement build() {
    // TODO: implement build
    return Center(
        expand: true, // occupe tout l'espace dispo
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: MaterialColor.fromHex('#fff'),
            borderRadius: BorderRadius.all(const Radius.circular(999)),
            boxShadow: const [
              BoxShadow(blurRadius: 16, color: 'rgba(0,0,0,.06)'),
            ],
          ),
          child: Text('Hello 👋'),
        ),
      );
  }
}
