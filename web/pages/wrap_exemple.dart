import '../flutter_library.dart';

class WrapExemple extends Rview {
  static final String url = "wrap";
  @override
  Relement build() {
    // TODO: implement build
    return Wrap(
      direction: Axis.horizontal,
      spacing: 12, // écart vertical principal
      runSpacing: 24, // écart entre colonnes
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        for (int i = 0; i < 8; i++)
          Container(
            height: 48,width: 100,
            decoration: const BoxDecoration(color: Color('#d0ebff')),
          ),
      ],
    );
  }
}
