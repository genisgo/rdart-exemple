import '../flutter_library.dart';

class ButtonGroupeExemple extends Rview {
  @override
  Relement build() {
    // TODO: implement build
    // IconButton ghost rond
    final ico = IconButton(
      icon: BsIcon(icon: Bicon.threeDots),
      style: IconButtonStyle.ghost,
      tooltip: 'Options',
      onPressed: () => print('options'),
    );

    // OutlinedButton secondaire avec icône
    final out = OutlinedButton(
      label: 'Annuler',
      leftIconHtml: '<i class="bi bi-x"></i>',
      variant: ElevatedVariant.secondary,
      onPressed: () => print('cancel'),
    );

    // ButtonGroup radio (single)
    final grp = ButtonGroup(
      buttons: [
        ElevatedButton(label: Text('Jour'), onPressed: () {}),
        ElevatedButton(label: Text('Semaine'), onPressed: () {}),
        ElevatedButton(label: Text('Mois'), onPressed: () {}),
      ],
      toggle: ButtonGroupToggle.single,
      initialActiveIndex: 0,
      onChange: (idxs) => print('active: $idxs'),
    );

    // ButtonGroup multi (checkbox)
    final grpMulti = ButtonGroup(
      buttons: [
        OutlinedButton(label: 'PDF', onPressed: () {}),
        OutlinedButton(label: 'CSV', onPressed: () {}),
        OutlinedButton(label: 'XLSX', onPressed: () {}),
      ],
      toggle: ButtonGroupToggle.multi,
      initialActives: {1},
      onChange: (idxs) => print('actifs: $idxs'),
    );
    var sizedBox = SizedBox(height: 20);
    return Column(
      children: [
        sizedBox,
        Text("IconButton"),
        ico,
        sizedBox,
        Text("OutlinedButton"),
        out,
        sizedBox,
        Text("Groupe Button Simple"),
        grp,
        sizedBox,
        grpMulti
      ],
    );
  }
}
