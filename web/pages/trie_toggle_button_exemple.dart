import '../flutter_library.dart';

class TrieToggleButtonExemple extends Rview {
  static final String url = "trieToggle";
  @override
  Relement build() {
    // TriToggleButton : Notifications
    final notify = TriToggleButton(
      label: 'Notifications',
      state: TriState.off,
      iconOff: BsIcon(icon: Bicon.bellSlash),
      iconOn: BsIcon(icon: Bicon.bell),
      iconIndeterminate: BsIcon(icon: Bicon.bellFill),
      variant: ElevatedVariant.primary,
      onChanged: (s) => print('state: $s'),
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: "Trie ToggleButton Exemple"),
      body: Column(children: [notify]),
    );
  }
}
