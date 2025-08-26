import '../flutter_library.dart';

class SegmentedControlExemple extends Rview {
  static final String url = "segmented-control";
  @override
  Relement build() {
    // TODO: implement build
    // SegmentedControl : Jour / Semaine / Mois
    final segments = SegmentedControl(
      items: [
        SegmentItem(
          label: 'Jour',
          icon: BsIcon(icon: Bicon.sun),
        ),
        SegmentItem(
          label: 'Semaine',
          icon: BsIcon(icon: Bicon.calendarWeek),
        ),
        SegmentItem(
          label: 'Mois',
          icon: BsIcon(icon: Bicon.calendarMonth),
        ),
      ],
      currentIndex: 0,
      size: ButtonSize.small,
      indicatorColor: '#fff',
      trackColor: '#eef2f7',
      onChanged: (i) => print('segment: $i'),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Semented Control")),
      body: Column(children: [segments]),
    );
  }
}
