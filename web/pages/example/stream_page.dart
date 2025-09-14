import '../../flutter_library.dart';
import '../../components/reactive_programing.dart';

class StreamPage extends Rview {
  static String url = "streams";
  final streamPage = ReactivePrograming();

  @override
  Relement build() {

    return Scaffold(
      appBar: AppBar(title: Text("Stream Page")),
      body: Column(
        children: [
          streamPage,
          SizedBox(height: 20),
          ElevatedButton(
            label: Text("Lancer le Stream"),
            onPressed: () {
              streamPage.childrensStramsControleur.addStream(_buildWidgets());
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            label: Text("Pause Stream"),
            onPressed: () {
              streamPage.subscription!.isPaused
                  ? streamPage.subscription?.resume()
                  : streamPage.subscription?.pause();
            },
          ),
        ],
      ),
    );
  }

  Stream<Relement> _buildWidgets() async* {
    _SizeAnimation size = _SizeAnimation();

    int cycle = 0;
    double height = 20;
    for (int i = 0; i < size.maxWidth; i += 10) {
      size.width = i.toDouble();

      if (size.width >= size.maxWidth - 10) {
        i = 0;
        cycle++;
        if (cycle == 2) {
          streamPage.subscription?.pause();
          await Future.delayed(Duration(seconds: 10));
          streamPage.subscription?.resume();
        }
      }
      await Future.delayed(Duration(milliseconds: 200));
      var borderRadius = BorderRadius.all(Radius.circular(8));
      yield Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: height,
            width: size.maxWidth,
            decoration: BoxDecoration(
              color: Colors.gray,
              borderRadius: borderRadius,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10),
            height: height,
            child: Stack(
              children: [
                Text("$i", color: Colors.white),
                if (cycle == 1)
                  SizedBox(
                    child: Card(
                      child: Text("Cycle $cycle", fontSize: 8),
                      padding: EdgeInsets.all(0),
                    ),
                    height: 20,
                  ),
              ],
            ),
            decoration: BoxDecoration(
              color: () {
                return switch (cycle) {
                  1 => Colors.red,
                  2 => Colors.green,
                  3 => Colors.cyan,
                  _ => Colors.indigo,
                };
              }(),
              borderRadius: borderRadius,
            ),
            width: size.width,
          ),
        ],
      );
    }
  }
}

class _SizeAnimation {
  double width = 0;
  double maxWidth = 500;
}
