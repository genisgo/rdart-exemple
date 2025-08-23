import '../flutter_library.dart';

class TextFieldExemple extends Rview {
  static final String url = "text-field";
  @override
  Relement build() {
    // 1) Email (outline + label flottant + helper)
    final emailCtl = TextEditingController();
    final email = TextField(
      controller: emailCtl,
      inputType: InputType.email,
      variant: InputVariant.outline,
      size: FieldSize.medium,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'ex: alice@mail.com',
        helperText: 'Nous ne partagerons pas votre email.',
        prefixIcon: BsIcon(icon: Bicon.mailbox2, color: Colors.red),
        showClearButton: true,
        maxLength: 50,
      ),
      onSubmitted: (v) => print('email: $v'),
    );

    // 2) Mot de passe (underline + toggle œil)
    final passCtl = TextEditingController();
    final password = TextField(
      controller: passCtl,
      inputType: InputType.password,
      variant: InputVariant.underline,
      decoration: const InputDecoration(
        labelText: 'Mot de passe',
        showPasswordToggle: true,
        autocomplete: 'new-password', // (optionnel) override
        errorText: null,
      ),
    );

    // 3) Nombre (filled + bornes + step + suffix)
    final qtyCtl = TextEditingController('1');
    final quantity = TextField(
      controller: qtyCtl,
      inputType: InputType.number,
      min: 0,
      max: 100,
      step: 1,
      variant: InputVariant.filled,
      decoration: InputDecoration(
        labelText: 'Quantité',
        suffixText: 'pcs',
        filled: true, // assure un fond même en `filled`
        fillColor: '#f3f4f6', // override
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      onChanged: (v) => print('qty: $v'),
    );

    var sizedBox = SizedBox(height: 20);
    return Scaffold(
      appBar: AppBar(title: "TextField Exemple"),
      body: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                sizedBox,
                email,
                sizedBox,
                password,
                sizedBox,
                quantity,
                sizedBox,
                sizedBox,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [Text("Exemple Complexe 1"), _ExempleOne()],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [Text("Exemple Complexe 2"), sizedBox, _ExempleTow()],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [Text("Exemple Complexe 3"), sizedBox, _ExempleThree()],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text("Exemple Complexe final"),
                sizedBox,
                _ExempleFinal(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExempleOne extends Rview {
  @override
  Relement build() {
    // TODO: implement build
    // --- Controllers
    final _emailCtl = TextEditingController();
    final _passCtl = TextEditingController();

    // --- Widgets
    final emailField = TextField(
      controller: _emailCtl,
      inputType: InputType.email,
      variant: InputVariant.outline,
      size: FieldSize.medium,
      
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'ex: alice@mail.com',
        prefixIcon: BsIcon(icon: Bicon.mailbox),
        showClearButton: true,
        maxLength: 60,
        border: OutlineInputBorder(
          borderRadius: 12,
          borderSide: BorderSide(color: 'rgba(0,0,0,.20)', width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: 12,
          borderSide: BorderSide(color: '#0d6efd', width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: 12,
          borderSide: BorderSide(color: '#dc3545', width: 2),
        ),

      ),
      onSubmitted: (v) => print('email submit: $v'),
    );

    final passwordField = TextField(
      controller: _passCtl,
      inputType: InputType.password,
      variant: InputVariant.outline,
      size: FieldSize.medium,
      focusColor: Colors.red,
      decoration: InputDecoration(
        labelText: 'Mot de passe',
        showPasswordToggle: true, // 👁️
        prefixIcon: BsIcon(icon: Bicon.lock, color: Colors.Black),
        border: OutlineInputBorder(
          borderRadius: 12,
          borderSide: BorderSide(color: 'rgba(0,0,0,.20)', width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: 12,
          borderSide: BorderSide(color: Colors.red.color, width: 5),
        ),
      ),
      onSubmitted: (v) => print('password submit: $v'),
    );

    // Exemple d’assemblage dans une colonne
    return Column(children: [emailField, SizedBox(height: 12), passwordField]);
  }
}

class _ExempleTow extends Rview {
  @override
  Relement build() {
    // TODO: implement build
    final searchCtl = TextEditingController();

    final searchField = TextField(
      controller: searchCtl,
      inputType: InputType.search,
      variant: InputVariant.filled, // fond géré par filled
      size: FieldSize.large,
      decoration: InputDecoration(
        labelText: 'Rechercher',
        hintText: 'Tapez un mot-clé',
        prefixIcon: BsIcon(icon: Bicon.search),
        showClearButton: true,
        filled: true,
        fillColor: '#f3f4f6',
        maxLength: 120,
        border: NoInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: 16,
          borderSide: BorderSide(color: 'rgba(13,110,253,.35)', width: 2),
        ),
        // petit rappel clavier à droite
        suffixText: 'Ctrl+K',
      ),
      onChanged: (v) => print('search: $v'),
    );

    return Column(children: [searchField]);
  }
}

class _ExempleThree extends Rview {
  @override
  Relement build() {
    // TODO: implement build
    final _qtyCtl = TextEditingController('1');
    final _prixCtl = TextEditingController('19.90');

    // Quantité (entier) — step 1
    final quantityField = TextField(
      controller: _qtyCtl,
      inputType: InputType.number,
      min: 0,
      max: 100,
      step: 1,
      variant: InputVariant.underline,
      size: FieldSize.medium,
      decoration: const InputDecoration(
        labelText: 'Quantité',
        suffixText: 'pcs',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: 'rgba(0,0,0,.25)', width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: '#0d6efd',
            width: 2,
            style: BorderStyleCss.dashed,
          ),
        ),
      ),
      onChanged: (v) => print('qty: $v'),
    );

    // Prix (decimal) — step 0.01
    final priceField = TextField(
      controller: _prixCtl,
      inputType: InputType.number,
      min: 0,
      max: 10000,
      step: 0.01, // clavier décimal mobile
      variant: InputVariant.underline,
      size: FieldSize.medium,
      decoration: const InputDecoration(
        labelText: 'Prix',
        prefixText: '€',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: 'rgba(0,0,0,.25)', width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: '#0d6efd', width: 2),
        ),
        helperText: 'TTC',
      ),
      onChanged: (v) => print('price: $v'),
    );

    return Column(children: [quantityField, SizedBox(height: 10), priceField]);
  }
}

class _ExempleFinal extends Rview {
  @override
  Relement build() {
    // TODO: implement build
    final _dateCtl = TextEditingController();
    final _timeCtl = TextEditingController();
    final _urlCtl = TextEditingController();
    final _noteCtl = TextEditingController();

    final dateField = TextField(
      controller: _dateCtl,
      inputType: InputType.date,
      variant: InputVariant.outline,
      size: FieldSize.small,
      decoration: InputDecoration(
        labelText: 'Date',
        prefixIcon: BsIcon(icon: Bicon.calculator),
        border: OutlineInputBorder(
          borderRadius: 10,
          borderSide: BorderSide(color: 'rgba(0,0,0,.20)', width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: 10,
          borderSide: BorderSide(color: '#0d6efd', width: 2),
        ),
      ),
    );

    final timeField = TextField(
      controller: _timeCtl,
      inputType: InputType.time,
      variant: InputVariant.outline,
      size: FieldSize.small,
      decoration: InputDecoration(
        labelText: 'Heure',
        prefixIcon: BsIcon(icon: Bicon.calendar2Heart),
        border: OutlineInputBorder(
          borderRadius: 10,
          borderSide: BorderSide(color: 'rgba(0,0,0,.20)', width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: 10,
          borderSide: BorderSide(color: '#0d6efd', width: 2),
        ),
      ),
    );

    final urlField = TextField(
      controller: _urlCtl,
      inputType: InputType.url,
      variant: InputVariant.outline,
      size: FieldSize.medium,
      decoration: InputDecoration(
        labelText: 'Lien de la réunion',
        hintText: 'https://…',
        autocomplete: 'url',
        prefixIcon: BsIcon(icon: Bicon.link),
        showClearButton: true,
        helperText: 'Collez un lien Zoom/Meet/Teams.',
        border: OutlineInputBorder(
          borderRadius: 12,
          borderSide: BorderSide(color: 'rgba(0,0,0,.20)', width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: 12,
          borderSide: BorderSide(color: '#0d6efd', width: 2),
        ),
      ),
      onSubmitted: (v) => print('url: $v'),
    );

    // “Note” longue: on reste type text, avec counter
    final noteField = TextField(
      controller: _noteCtl,
      inputType: InputType.text,
      variant: InputVariant.filled,
      size: FieldSize.large,
      decoration: const InputDecoration(
        labelText: 'Note',
        hintText: 'Détails importants (max 140 caractères)…',
        filled: true,
        fillColor: '#f7f7fb',
        maxLength: 140, // compteur auto
        border: OutlineInputBorder(
          borderRadius: 12,
          borderSide: BorderSide(color: 'transparent', width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: 12,
          borderSide: BorderSide(color: 'rgba(13,110,253,.35)', width: 2),
        ),
      ),
      onChanged: (v) => print('note: ${v.length}/140'),
    );

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: dateField),
            SizedBox(width: 8),
            Expanded(child: timeField),
          ],
        ),
        SizedBox(height: 10),
        urlField,
        SizedBox(height: 10),
        noteField,
      ],
    );
  }
}
