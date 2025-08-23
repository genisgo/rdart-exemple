import '../flutter_library.dart';

class CheckExemple extends Rview {
  static final String url = "check";
  @override
  Relement build() {
    final sw = Switch(value: true, onChanged: (v) => print('switch: $v'));
    final chk = Checkbox(
      value: false,
      label: 'J’accepte',
      onChanged: (v) => print('chk $v'),
    );
    final rd1 = RRadio<String>(
      name: 'group1',
      value: 'a',
      groupValue: 'a',
      label: 'A',
      onChanged: (v) => print(v),
    );
    final rd2 = RRadio<String>(
      name: 'group1',
      value: 'b',
      groupValue: 'a',
      label: 'B',
      onChanged: (v) => print(v),
    );
    final sl = RSlider(value: .5, onChanged: (v) => print('slider: $v'));
    var sizedBox = SizedBox(height: 20);
    return Column(
      children: [sw, sizedBox, chk, sizedBox, rd1, sizedBox, rd2, sizedBox, sl],
    );
  }
}
