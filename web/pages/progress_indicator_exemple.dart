import '../flutter_library.dart';

class ProgressIndicatorExemple extends Rview {
  static final String url = "progress-indicator";
  @override
  Relement build() {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("LinearProgressIndicator Exemple")),
      body: Column(
        children: [Text("LinearProgressIndicator"), LinearProgressIndicator()],
      ),
    );
  }
}
