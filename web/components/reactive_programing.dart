import 'dart:async';

import '../flutter_library.dart';

class ReactivePrograming extends Rview {
  final childrensStramsControleur = StreamController<Relement>();
  late var stream = childrensStramsControleur.stream;
  StreamSubscription<Relement>? subscription;

  Relement child = Container();
  @override
  void initState() {
    subscription = stream.listen((event) {
      child = event;
      setState(() {});
    });
    subscription?.onDone(() async {
      print("terminer${(await stream.first).getElement}");
    });
    super.initState();
  }

  @override
  Relement build() {
    return Container(child: child, height: 500, width: 500);
  }

  void cancel() {
   
    subscription?.cancel(); 
  }

}
