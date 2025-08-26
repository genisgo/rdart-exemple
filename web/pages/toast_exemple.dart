import '../flutter_library.dart';

class ToastExemple extends Rview {
  static final String url ="toast"; 
  @override
  Relement build() {
    // TODO: implement build

    // titre & message en Relement
    final title = Text('Succès', fontWeight: FontWeightCss.w800);

    final message = Text('Produit ajouté au panier');

    // Info centrée avec action et message complexe
    final infoMsg = Column(
      gap: 4,
      children: [
        Text('Nouvelle version disponible 1.2.0'),
        Text(
          'Redémarrez pour appliquer la mise à jour',
          color: MaterialColor.fromHex('#8aa0b9'),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("Toast Exemple")),
      body: Column(
        children: [
          ElevatedButton(
            label: Text("Toast Mise à jour"),
            onPressed: () {
              ToastHost.info(
                infoMsg,
                title: Text('Mise à jour'),
                icon: BsIcon(icon: Bicon.checkCircle),
                pos: ToastPosition.topCenter,
                durationMs: 7000,
              );
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            label: Text("Toast Succès"),
            onPressed: () {
              ToastHost.show(
                ToastOptions(
                  title: title,
                  message: message,
                  icon: BsIcon(icon: Bicon.checkCircle),
                  type: ToastType.success,
                  decoration: BoxDecoration(
                    color: MaterialColor.fromHex('#0f172aF2'),
                    borderRadius: BorderRadius.all(Radius.circular(999)),
                    border: Border(
                      all: BorderSide(color: MaterialColor(34, 197, 94, .35)),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
