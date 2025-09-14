import '../flutter_library.dart';
import 'dart:html' as html;

class SizeAnimationExemple extends Rview {
  static final String url = "sizeAnimation";
  @override
  Relement build() {
    return Scaffold(
      appBar: AppBar(title: Text("SizeAnimation Exemple")),
      body: Column(
        children: [
          sizeAnimationDemoScalePulse(),
          SizedBox(height: 20),
          runSizeAnimationDemoBox(),
          SizedBox(height: 10),
          ...runSizeAnimationDemoControlled(),
        ],
      ),
    );
  }

  Relement sizeAnimationDemoScalePulse() {
    final btn = _DemoButton('Ajouter au panier');
    final anim = SizeAnimation.scale(
      child: btn,
      from: const SizeScale(1.0, 1.0),
      to: const SizeScale(1.08, 1.08),
      durationMs: 600,
      loop: true,
      yoyo: true,
      applyOn: SizeApplyOn.child, // scale sur l'enfant pour garder le conteneur
    );
    // document.body!.append(anim.create());
    return anim;
  }

  Relement runSizeAnimationDemoBox() {
    final card = _DemoCard(width: 180, height: 120, label: 'Étroit → Large');
    final anim = SizeAnimation.size(
      child: card,
      from: AnimationSizeBox(widthPx: 180, heightPx: 120),
      to: AnimationSizeBox(widthPx: 320, heightPx: 120),
      durationMs: 900,
      easing: SizeEasing.easeInOut,
      applyOn: SizeApplyOn.root, // largeur appliquée au wrapper
    );
    return anim;
    // document.body!.append(anim.create());
  }
}

// -----------------------------------------------------------------------------
// DEMOS
// -----------------------------------------------------------------------------

// 1) SCALE — bouton qui pulse en loop (yoyo)

// 2) SIZE — carte qui s'élargit en douceur (width/height)

// 3) Contrôlée — clic pour play/pause
List<Relement> runSizeAnimationDemoControlled() {
  final ctrl = SizeAnimationController();
  final anim = SizeAnimation.scale(
    controller: ctrl,
    child: _DemoBadge('Clique pour PLAY/PAUSE'),
    from: const SizeScale(1.0, 1.0),
    to: const SizeScale(1.25, 1.25),
    durationMs: 700,
    autoplay: false,
    applyOn: SizeApplyOn.child,
  );
  // final el = anim.create();
  // el.onClick.listen((_) {
  //   ctrl.isRunning ? ctrl.pause() : ctrl.play();
  // });
  // document.body!.append(el);
  return [
    Text("Size Animation Text"),
    anim,
    ElevatedButton(
      label: Text("Start Animation"),
      onPressed: () {
        ctrl.isRunning ? ctrl.stop() : ctrl.play();
      },
    ),
  ];
}

// -----------------------------------------------------------------------------
// Petits Relements de démo (remplace par tes propres composants)
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
      ..style.border = '1px solid rgba(255,255,255,.10)'
      ..style.backgroundColor = '#0f172a'
      ..style.color = '#e6eefc'
      ..style.cursor = 'pointer'
      ..style.boxShadow = '0 8px 20px -12px rgba(0,0,0,.6)';
    _el.onMouseOver.listen((_) => _el.style.filter = 'brightness(1.06)');
    _el.onMouseOut.listen((_) => _el.style.filter = 'none');
    return _el;
  }

  @override
  html.Element get getElement => _el;
}

class _DemoCard extends Relement {
  final double width;
  final double height;
  final String label;
  _DemoCard({
    required this.width,
    required this.height,
    required this.label,
    super.id,
  });
  late html.DivElement _el;
  @override
  html.Element create() {
    _el = html.DivElement()
      ..style.width = '${width}px'
      ..style.height = '${height}px'
      ..style.borderRadius = '14px'
      ..style.border = '1px solid rgba(255,255,255,.08)'
      ..style.backgroundColor = 'rgba(15,23,42,.8)'
      ..style.color = '#e6eefc'
      ..style.display = 'flex'
      ..style.alignItems = 'center'
      ..style.justifyContent = 'center'
      ..style.margin = '12px 0'
      ..text = label;
    return _el;
  }

  @override
  html.Element get getElement => _el;
}

class _DemoBadge extends Relement {
  final String text;
  _DemoBadge(this.text, {super.id});
  late html.DivElement _el;
  @override
  html.Element create() {
    _el = html.DivElement()
      ..style.display = 'inline-block'
      ..style.padding = '6px 10px'
      ..style.borderRadius = '999px'
      ..style.backgroundColor = 'rgba(99,102,241,.15)'
      ..style.border = '1px solid rgba(99,102,241,.35)'
      ..style.color = 'black'
      ..text = text;
    return _el;
  }

  @override
  html.Element get getElement => _el;
}
