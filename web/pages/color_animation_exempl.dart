import '../flutter_library.dart';
import 'dart:html' as html;

class ColorAnimationExempl extends Rview {
  static final String url = "colorAnimation";
  @override
  Relement build() {

    final ctrl = ColorAnimationController();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Animation de couleur")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Card Animation"),
            SizedBox(height: 10),
            ColorAnimation(
              from: '#0ea5e9',
              to: '#a78bfa',
              targets: const [ColorTarget.background],
              durationMs: 1200,
              easing: ColorEasing.easeOut,
              autoplay: true,
              loop: true,
              yoyo: true,
              child: _DemoCard('Carte animée (fond)'),
            ),
            SizedBox(height: 10),
            ColorAnimation(
              controller: ctrl,
              from: 'rgb(255,255,255)',
              to: 'rgb(16,185,129)',
              targets: const [ColorTarget.text],
              applyOn: ColorApplyOn.child,
              durationMs: 800,delayMs: 400,
              autoplay: false,
              child: _DemoCard('Clique pour PLAY / PAUSE', textMode: true),
            ),
            ElevatedButton(
              label: Text("Start Animation"),
              onPressed: () {
                // ctrl.play();
                ctrl.isRunning ? ctrl.pause() : ctrl.play();
              },
            ),
            ColorAnimation(
              from: 'rgba(99,102,241,0.2)',
              to: 'rgba(99,102,241,0.9)',
              targets: const [ColorTarget.border],
              durationMs: 700,
              delayMs: 300,
              loop: true,
              yoyo: true,
              autoplay: true,
              child: _DemoButton('Acheter maintenant'),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// DEMOS (fonctionnent toutes)
// -----------------------------------------------------------------------------

// 1) Carte qui "respire" (fond) — root par défaut
void runColorAnimationDemoLoop() {
  final card = ColorAnimation(
    from: '#0ea5e9',
    to: '#a78bfa',
    targets: const [ColorTarget.background],
    durationMs: 1200,
    easing: ColorEasing.easeInOut,
    autoplay: true,
    loop: true,
    yoyo: true,
    child: _DemoCard('Carte animée (fond)'),
  );
  // document.body!.append(card.create());
}

// 2) Texte qui change de couleur (applyOn: child)
void runColorAnimationDemoControlled() {
  final ctrl = ColorAnimationController();
  final anim = ColorAnimation(
    controller: ctrl,
    from: 'rgb(255,255,255)',
    to: 'rgb(16,185,129)',
    targets: const [ColorTarget.text],
    applyOn: ColorApplyOn.child,
    durationMs: 800,
    autoplay: false,
    child: _DemoCard('Clique pour PLAY / PAUSE', textMode: true),
  );
  final el = anim.create();
  el.onClick.listen((_) {
    ctrl.isRunning ? ctrl.pause() : ctrl.play();
  });
  // document.body!.append(el);
}

// 3) Bouton avec bordure pulsante (applyOn: child)
void runColorAnimationDemoBorder() {
  final anim = ColorAnimation(
    from: 'rgba(99,102,241,0.2)',
    to: 'rgba(99,102,241,0.9)',
    targets: const [ColorTarget.border],
    applyOn: ColorApplyOn.child,
    durationMs: 700,
    delayMs: 300,
    loop: true,
    yoyo: true,
    child: _DemoButton('Acheter maintenant'),
  );
  // document.body!.append(anim.create());
}

// -----------------------------------------------------------------------------
// Relements de démo
class _DemoCard extends Relement {
  final String title;
  final bool textMode;
  _DemoCard(this.title, {this.textMode = false, super.id});
  late html.DivElement _el;
  @override
  html.Element create() {
    _el = html.DivElement()
      ..style.padding = '16px 20px'
      ..style.margin = '10px 0'
      ..style.borderRadius = '14px'
      ..style.border = '1px solid rgba(255,255,255,.08)'
      ..style.backgroundColor = textMode ? 'transparent' : 'rgba(15,23,42,.8)';
    if (!textMode) {
      _el.style.color = '#e6eefc';
    }
    _el.text = title;
    return _el;
  }

  @override
  html.Element get getElement => _el;
}

class _DemoButton extends Relement {
  final String label;
  _DemoButton(this.label, {super.id});
  late html.ButtonElement _el;
  @override
  html.Element create() {
    _el = html.ButtonElement()
      ..text = label
      ..style.padding = '10px 16px'
      ..style.borderRadius = '12px'
      ..style.border = '2px solid rgba(99,102,241,.2)'
      ..style.backgroundColor = '#0f172a'
      ..style.color = '#e6eefc'
      ..style.cursor = 'pointer';
    _el.onMouseOver.listen((_) => _el.style.filter = 'brightness(1.06)');
    _el.onMouseOut.listen((_) => _el.style.filter = 'none');
    return _el;
  }

  @override
  html.Element get getElement => _el;
}
