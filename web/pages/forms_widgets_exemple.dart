import '../flutter_library.dart';

class FormsWidgetsExemple extends Rview {
  static final String url = "forms";
  @override
  Relement build() {
    // TODO: implement build
    final formCtl = FormController(
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
    final items = [
      DropdownItem(
        value: 'alpha',
        child: Row(
          children: [
            CircleAvatar(imageUrl: 'https://picsum.photos/seed/a/64'),
            Text('Alpha'),
          ],
          gap: 8,
        ),
      ),
      DropdownItem(
        value: 'beta',
        child: Row(
          children: [
            CircleAvatar(imageUrl: 'https://picsum.photos/seed/b/64'),
            Text('Beta'),
          ],
          gap: 8,
        ),
      ),
      DropdownItem(
        value: 'gamma',
        child: Row(
          children: [
            CircleAvatar(imageUrl: 'https://picsum.photos/seed/c/64'),
            Text('Gamma'),
          ],
          gap: 8,
        ),
      ),
    ];

    final dd = DropdownField<String>(size: FieldSize.large,
      items: items,
      hint: SizedBox(height: 50,child: Text('Choisir un projet', color: MaterialColor.fromHex('#9fb2cc'))),
      decoration: const InputDecoration(labelText: 'Projet',),
      onChanged: (v) {
        print('Choisi: $v');
      },
    );

    // 1) Dropdown pays
    var materialColor = MaterialColor.fromHex("#9fb2cc");
    final country = DropdownFormField<int>(
      controller: formCtl,
      items: [
        DropdownItem(
          value: 1,
          child: Row(
            children: [
              CircleAvatar(imageUrl: 'https://picsum.photos/seed/u/64'),
              Column(
                children: [
                  Text('Utilisateur'),
                  Text('Accès standard', color: materialColor),
                ],
              ),
            ],
          ),
        ),
        DropdownItem(
          value: 2,
          child: Row(
            children: [
              CircleAvatar(imageUrl: 'https://picsum.photos/seed/a/64'),
              Column(
                children: [
                  Text('Administrateur'),
                  Text('Tous les droits', color: materialColor),
                ],
              ),
            ],
          ),
        ),
      ],
      decoration: const InputDecoration(labelText: 'Pays'),
      validator: (v) => (v == null) ? 'Choisis un pays' : null,
      onSaved: (v) => print('pays: $v'),
    );

    final itemsMutlti = [
      MultiSelectItem(
        value: 'a',
        child: Row(
          children: [CircleAvatar(imageUrl: 'https://picsum.photos/seed/a/64'), Text('Alpha')],
        ),
      ),
      MultiSelectItem(
        value: 'b',
        child: Row(
          children: [CircleAvatar(imageUrl: 'https://picsum.photos/seed/b/64'), Text('Beta')],
        ),
      ),
      MultiSelectItem(
        value: 'g',
        child: Row(
          children: [CircleAvatar(imageUrl: 'https://picsum.photos/seed/c/64'), Text('Gamma')],
        ),
      ),
    ];

    final multiSelects = MultiSelectField<String>(
      items: itemsMutlti,
      values: const ['a', 'g'],
      hint: Text('Choisir des tags', color: MaterialColor.fromHex('#9fb2cc')),
      decoration: const InputDecoration(labelText: 'Tags'),
      onChanged: (v) {
        print('choisi: $v');
      },
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
        helperText: 'Tape puis choisis',border: OutlineInputBorder(borderSide: BorderSide(color: Colors.gray))
      ),
      validator: (v) => (v == null || v.isEmpty) ? 'Ville requise' : null,
      onSaved: (v) => print('ville: $v'),
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

    // // 5) TextArea bio
    // final bio = TextAreaFormField(
    //   controller: formCtl,
    //   onChanged: (value) {
    //     print(value);
    //   },
    //   decoration: InputDecoration(
    //     labelText: 'Bio',
    //     helperText: 'Quelques lignes sur toi',
    //     filled: true,
    //     fillColor: '#f7f7fb',
    //     border: OutlineInputBorder(borderRadius: 12),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: 12,
    //       borderSide: BorderSide(
    //         color: MaterialColor.fromHex('#0d6efd'),
    //         width: 2,
    //       ),
    //     ),
    //   ),
    //   validator: (v) => v.trim().length < 10 ? '10 caractères minimum' : null,
    //   onSaved: (v) => print('bio: $v'),
    // );

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
          // SizedBox(height: 100, width: 400, child: interests),
          SizedBox(height: 100, width: 400, child: gender),
          // SizedBox(height: 100, width: 400, child: bio),
          SizedBox(height: 100, width: 400, child: dd),
          Text("MultiSelect"),
          SizedBox(height: 100, width: 400, child: multiSelects),
          Center(child: files, expand: true),
          terms,
          notif,
          volume,
          Row(
            children: [
              ElevatedButton(
                label: Text('Valider'),
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
      appBar: AppBar(title: Text("Form Exemple")),
      body: Container(width: 500, child: form),
    );
  }
}
