import '../flutter_library.dart';

class AlertDialogExemple extends Rview {
  static final String url = "alert-dialog";
  @override
  Relement build() {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: "Alert Dialog Exemple"),
      body: Expanded(
        child: Center(
          child: Column(
            children: [
              _optionButton(callback: exampleAlert, title: "Open Alert Dialog"),
              _optionButton(
                callback: exampleConfirm,
                title: "Open Confim Dialog",
                variant: ElevatedVariant.secondary,
              ),
              _optionButton(
                callback: exampleCustom,
                title: "Open Custom Dialog",
                variant: ElevatedVariant.success
              ),
            ],
          ),
        ),
      ),
    );
  }

  Relement _optionButton({
    required void Function() callback,
    required String title,
    ElevatedVariant variant = ElevatedVariant.primary,
  }) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        variant: variant,
        label: title,
        onPressed: () {
          callback();
        },
      ),
    );
  }

  void exampleAlert() {
    showAlert(
      title: 'Information',
      content: Text('Votre session va expirer dans 5 minutes.'),
    );
  }

  void exampleConfirm() async {
    final ok = await showConfirm(
      title: 'Supprimer',
      content: Text(
        'Confirmer la suppression ? Cette action est irréversible.',
      ),
      cancelLabel: 'Annuler',
      okLabel: 'Supprimer',
    );
    if (ok) {
      // ... action
    }
  }

  // Exemple complet avec actions personnalisées et builder
  void exampleCustom() {
    late var dlg = AlertDialog<int>(
      title: 'Choisir une option',
      content: Text('Sélectionne une des réponses ci-dessous.'),
      actionsAlignment: ActionsAlignment.spaceBetween,
      actionsBuilder: (ctrl) {
        return [
          TextButton(label: "1", onPressed: () => ctrl.close(1)),
          TextButton(label: "2", onPressed: () => ctrl.close(2)),
          TextButton(label: "3", onPressed: () => ctrl.close(3)),
        ];
      },
    );
    showDialog<int>(dialog: dlg).then((value) {
      print("ShowDialog Value $value");
      // value ∈ {1,2,3} ou null si fermé
    });
  }
}

// ============================================================================
// EXEMPLES D'UTILISATION (à titre indicatif)
// ============================================================================
