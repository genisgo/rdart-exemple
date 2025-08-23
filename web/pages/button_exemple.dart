import '../flutter_library.dart';
import 'button_groupe_exemple.dart';

class ButtonExemple extends Rview {
  static final String url = "button";
  @override
  Relement build() {
    final primary = MaterialButton(
      label: 'Valider',
      icon: BsIcon(icon: Bicon.houseAdd),
      onPressed: () => window.alert('OK'),
      backgroundColor: MaterialColor.fromHex('#2563eb'),
      foregroundColor: MaterialColor(255, 255, 255),
      elevation: 6,
      size: ButtonSize.large,
    );

    final outline = MaterialButton(
      label: 'Continuer',
      icon: BsIcon(icon: Bicon.activity),
      iconPosition: IconPosition.trailing,
      onPressed: () {},
      backgroundColor: MaterialColor(255, 255, 255),
      foregroundColor: MaterialColor.fromHex('#111827'),
      borderColor: MaterialColor.fromHex('#e5e7eb'),
      borderWidth: 1,
    );

    final disabled = MaterialButton(
      label: 'Désactivé',
      onPressed: null,
      backgroundColor: MaterialColor.fromHex('#334155'),
      foregroundColor: MaterialColor(255, 255, 255),
    );
    // TODO: implement build
    // TextButton basique (bleu comme un lien)
    final tb = TextButton(
      label: 'Voir plus',
      onPressed: () => print('clicked'),
      bootstrap: const ['text-primary'], // optionnel
    );

    // ElevatedButton primaire avec icône à gauche
    final eb = ElevatedButton(
      label: Text('Enregistrer'),
      leftIcon: BsIcon(icon: Bicon.check2),
      onPressed: () => print('save'),
      variant: ElevatedVariant.primary,
    );

    // Disabled + loading
    final loadBtn = ElevatedButton(
      label: Text('Chargement...'),
      loading: true,
      onPressed: null, // inactif
      variant: ElevatedVariant.secondary,
    );

    // Full width + grand
    final full = ElevatedButton(
      label:Text( 'Continuer'),
      size: ButtonSize.large,
      fullWidth: true,
      onPressed: () {},
    );

    var sizedBox = SizedBox(height: 10);
    return Scaffold(
      appBar: AppBar(title: "Exemple de Buttons"),
      body: Column(
        children: [
          _addPadding(tb),
          sizedBox,
          _addPadding(eb),
          sizedBox,
          _addPadding(loadBtn),
          sizedBox,
          _addPadding(full),
          SizedBox(height: 20),
          ButtonGroupeExemple(),
          sizedBox,
          _addPadding(primary),
          sizedBox,
         _addPadding(outline),
          sizedBox,
          _addPadding(disabled),
        ],
      ),
    );
  }

  Padding _addPadding(Relement tb) => Padding(padding: EdgeInsets.all(10), child: tb);
}
