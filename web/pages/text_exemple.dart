import '../flutter_library.dart';

class TextExemple extends Rview {
  static final String url = "text";
  @override
  Relement build() {
    // TODO: implement build
    // 1) Padding + Text
    final title = Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Text('Bienvenue 👋', fontSize: 20, fontWeight: FontWeightCss.w600),
    );

    // 2) SizedBox comme espaceur vertical
    final gap = SizedBox(height: 16);

    // 3) Text multi-ligne ellipsé à 2 lignes
    final desc = Text(
      'Ceci est une description longue qui sera tronquée après deux lignes...',
      color: Color("'#495057'"),
      maxLines: 2,
      overflow: TextOverflowCss.ellipsis,
    );

    // 4) Text en une seule ligne, non sélectionnable, aligné à droite
    final tag = Text(
      'STATUT: OK',
      selectable: false,
      textAlign: TextAlign.end,
      fontWeight: FontWeightCss.bold,
      fontSize: 12,
    );

    return Column(children: [title, gap, desc, gap, tag]);
  }
}
