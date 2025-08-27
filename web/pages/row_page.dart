import '../flutter_library.dart';
import 'contenair_test.dart';
class RowPage extends Rview {
  static final String url = "row";
  final row = Row(
    gap: 12,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 80,
        height: 40,
        decoration: const BoxDecoration(color: Color('#e9ecef')),
      ),
      Expanded(
        child: Container(
          height: 40,
          decoration: const BoxDecoration(color: Color('#d0ebff')),
        ),
      ),
      Container(
        width: 80,
        height: 40,
        decoration: const BoxDecoration(color: Color('#e9ecef')),
      ),
    ],
  );

  @override
  Relement build() {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Exemple Row et Expanded")),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        gap: 8,
        children: [
          Container(
            height: 60,
            decoration: const BoxDecoration(color: Color('#fff3bf')),
          ),
          Expanded(
            child: Center(
              expand: AlignExpand.all,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                decoration: const BoxDecoration(color: Color('#d3f9d8')),
                constraints: BoxConstraints(
                  maxHeight: 200,
                  minHeight: 300,
                  minWidth: 300,
                ),
                child: Text("Element Expanded"),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 60,
                height: 40,
                decoration: const BoxDecoration(color: Colors.red),
              ),
              Spacer(),
              Container(
                width: 60,
                height: 40,
                decoration: const BoxDecoration(color:Colors.green),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              rnavigator.push('/');
              break;
              case 1: 
              rnavigator.push(ContenairTest.url);
            default:
          }
        },
        items: [
          BottomNavItem(
            label: "Home",
            icon: BsIcon(icon: Bicon.arrowBarLeft),
          ),
          BottomNavItem(
            label: "Contenair",
            icon: BsIcon(icon: Bicon.folder),
          ),
        ],
      ),
    );
  }
}
