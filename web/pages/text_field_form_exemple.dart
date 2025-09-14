import '../flutter_library.dart';

class TextFieldFormExemple extends Rview {
  static final url ="textfieldform";
  final formCtrl = FormController(
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );

  @override
  Relement build() {
    return Scaffold(
      appBar: AppBar(title: Text('Édition du profil')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          controller: formCtrl,
          child: Column(
            children: [
              // --------- Pseudo obligatoire avec compteur ----------
              TextFormField(
                controller: formCtrl,
                decoration: InputDecoration(
                  labelText: 'Pseudo',
                  helperText: 'Choisissez un pseudo public',
                  counterText:
                      '', // le TextField gère automatiquement le compteur
                ),
                validator: (v) {
                  if (v.isEmpty) return 'Le pseudo est obligatoire';
                  if (v.length < 4) return 'Au moins 4 caractères requis';
                  if (v.length > 20) return 'Maximum 20 caractères autorisés';
                  return null;
                },
                onSaved: (v) => print('Pseudo sauvegardé: $v'),
                onChanged: (v) => print('Pseudo modifié: $v'),
              ),

              SizedBox(height: 30),

              Row(
                gap: 12,
                children: [
                  ElevatedButton(
                    label: Text('Sauvegarder'),
                    onPressed: () {
                      if (formCtrl.validate()) {
                        formCtrl.save();
                        print('Formulaire valide et sauvegardé !');
                      } else {
                        print('Erreurs dans le formulaire');
                      }
                    },
                  ),
                  OutlinedButton(
                    label: Text('Réinitialiser'),
                    onPressed: () {
                      formCtrl.reset();
                      print('Formulaire réinitialisé');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
