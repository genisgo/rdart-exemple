import '../flutter_library.dart';

class FormsWidgetsExemple extends Rview {
  static final String url = "forms";
  @override
  Relement build() {
    // TODO: implement build
    final formCtl = FormController(
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );

    // 1) Dropdown pays
    final country = DropdownFormField<String>(
      controller: formCtl,
      items: [
        DropdownMenuItem(value: 'ml', label: 'Mali'),
        DropdownMenuItem(value: 'sn', label: 'Sénégal'),
        DropdownMenuItem(value: 'ci', label: "Côte d’Ivoire"),
      ],
      decoration: const InputDecoration(labelText: 'Pays'),
      validator: (v) => (v == null) ? 'Choisis un pays' : null,
      onSaved: (v) => print('pays: $v'),
    );

    // 2) ComboBox ville (saisie + suggestions)
    final city = ComboBoxFormField(
      controller: formCtl,
      items: [
        ComboBoxItem('Bamako', 'Bamako'),
        ComboBoxItem('Sikasso', 'Sikasso'),
        ComboBoxItem('Kayes', 'Kayes'),
      ],
      decoration: const InputDecoration(
        labelText: 'Ville',
        helperText: 'Tape puis choisis',
      ),
      validator: (v) => (v == null || v.isEmpty) ? 'Ville requise' : null,
      onSaved: (v) => print('ville: $v'),
    );

    // 3) MultiSelect intérêts
    final interests = MultiSelectFormField<String>(
      controller: formCtl,
      items: [
        DropdownMenuItem(value: 'music', label: 'Musique'),
        DropdownMenuItem(value: 'sport', label: 'Sport'),
        DropdownMenuItem(value: 'code', label: 'Code'),
      ],
      decoration: const InputDecoration(labelText: 'Centres d’intérêt'),
      validator: (v) => v.isEmpty ? 'Sélectionne au moins un intérêt' : null,
      onSaved: (v) => print('intérêts: $v'),
    );

    // 4) RadioGroup genre
    final gender = RadioGroupFormField<String>(
      controller: formCtl,
      name: 'gender',
      options: [
        RadioOption('m', 'Homme'),
        RadioOption('f', 'Femme'),
        RadioOption('x', 'Autre'),
      ],
      validator: (v) => v == null ? 'Choisis une option' : null,
      onSaved: (v) => print('genre: $v'),
    );

    // 5) TextArea bio
    final bio = TextAreaFormField(
      controller: formCtl,
      onChanged: (value) {
        print(value);
      },
      decoration: const InputDecoration(
        labelText: 'Bio',
        helperText: 'Quelques lignes sur toi',
        filled: true,
        fillColor: '#f7f7fb',
        border: OutlineInputBorder(borderRadius: 12),
        focusedBorder: OutlineInputBorder(
          borderRadius: 12,
          borderSide: BorderSide(color: '#0d6efd', width: 2),
        ),
      ),
      validator: (v) => v.trim().length < 10 ? '10 caractères minimum' : null,
      onSaved: (v) => print('bio: $v'),
    );

    // 6) Fichiers
    final files = FilePickerFormField(
      label: BsIcon(icon: Bicon.filePdf),
      controller: formCtl,
      multiple: true,
      accept: 'image/*,.pdf',
      maxFiles: 3,
      maxSizeMB: 10,
      validator: (fs) => fs.isEmpty ? 'Ajoute au moins un fichier' : null,
      onSaved: (fs) => print('files: ${fs.length}'),
    );

    // 7) Checkbox / Switch / Slider
    final terms = CheckboxFormField(
      controller: formCtl,
      value: false,
      label: 'J’accepte les CGU',
      validator: (v) => v ? null : 'Obligatoire',
      onSaved: (v) => print('CGU: $v'),
    );

    final notif = SwitchFormField(
      controller: formCtl,
      value: true,
      label: 'Recevoir les notifications',
      onSaved: (v) => print('notif: $v'),
    );

    final volume = SliderFormField(
      controller: formCtl,
      value: 30,
      min: 0,
      max: 100,
      step: 1,
      label: 'Volume',
      onSaved: (v) => print('volume: $v'),
    );

    // Ensuite, place-les dans un Form(child: Column(...)) et un bouton:
    final form = Form(
      controller: formCtl,
      child: Column(
        children: [
          SizedBox(height: 100, width: 400, child: country),
          SizedBox(height: 100, width: 400, child: city),
          SizedBox(height: 100, width: 400, child: interests),
          SizedBox(height: 100, width: 400, child: gender),
          SizedBox(height: 100, width: 400, child: bio),
          Center(child: files, expand: true),
          terms,
          notif,
          volume,
          Row(
            children: [
              ElevatedButton(
                label: 'Valider',
                onPressed: () {
                  if (formCtl.validate()) {
                    formCtl.save();
                    window.alert('OK ✅');
                  }
                },
              ),
              TextButton(label: 'Reset', onPressed: () => formCtl.reset()),
            ],
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(title: "Form Exemple"),
      body: Container(width: 500, child: form),
    );
  }
}
