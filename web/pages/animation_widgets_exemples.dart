import '../flutter_library.dart';
import 'dart:html' as html;
import 'example/animation_hero_live.dart';

class AnimationWidgetsExemples extends Rview {
  static final String url = "animated";
  final fs = FadeScaleTransition(child: _Box('Hello', '#e0e7ff'));
  final sw = AnimatedSwitcher(child: _Box('A', '#fef9c3'));
  final sk = Shimmer(
    width: 180,
    height: 16,
    baseColor: '#f1f5f9',
    highlightColor: '#ffffff',
  );
  final avatar = Shimmer(
    borderRadius: 999,
    child: _Box(' ', '#e2e8f0'),
    baseColor: '#e2e8f0',
    highlightColor: '#ffffff',
  );

  // final pageA = Container(
  //   decoration: BoxDecoration(color: Colors.red.color),
  //   child: Hero(tag: 'img1', child: _Box('A', '#fde68a')),
  // );
  // final pageB = Container(
  //   child: Hero(tag: 'img1', child: _Box('B', '#bbf7d0')),
  // );

  @override
  void initState() {
    // HeroAnimator.transition(
    //   fromPage: pageA.getElement,
    //   toPage: pageB.getElement,
    //   tag: 'img1',
    //   durationMs: 500,
    //  );
    demoHero();
    super.initState();
  }

  void demoSwitcher() {
    Future.delayed(Duration(milliseconds: 3000), () {
      sw.setChild(_Box('B', '#fde68a'));
    });
    Future.delayed(Duration(milliseconds: 6000), () {
      sw.setChild(_Box('C', '#bbf7d0'));
    });
  }

  void demoHero() {
    // Page A – un petit card
    final pageA = html.DivElement()..style.padding = '24px';
    final heroA = Hero(tag: 'card', child: _Card('A', '#eef2ff')).create();
    pageA.children.add(heroA);
    getElement.append(pageA);

    // Page B – un card plus large (forme différente)
    final pageB = html.DivElement()..style.padding = '80px 40px';
    final heroB = Hero(
      tag: 'card',
      child: _Card('B', '#dcfce7', wide: true),
    ).create();
    pageB.children.add(heroB);

    // Lancer la transition après 1s
    Future.delayed(Duration(microseconds: 2000), () {
      HeroAnimator.transition(
        fromPage: pageA,
        toPage: pageB,
        tag: 'card',
        durationMs: 420,
        fadePages: true,
        animateBorderRadius: true,
      );
    });
  }

  @override
  Relement build() {
    demoFadeScale();
    demoSwitcher();
    var sizedBox = SizedBox(height: 20);
    return Scaffold(
      appBar: AppBar(title: "Animated Exemple"),
      body: Column(
        children: [
          ExpandablePanel(
            header: _Box('Clique pour ouvrir', '#dbeafe'),
            body: _Box('Contenu long...\nLigne 2\nLigne 3', '#e5e7eb'),
          ),

          sizedBox,
          fs,
          sizedBox,
          // sw,
          sizedBox,
          Text("Shimmer Skeleton simple"),
          sk,
          sizedBox,
          Text("Shimmer Avatar Custom"),
          avatar,
          sizedBox,
          Text("Hero 1"),
          ElevatedButton(
            label:Text( "Users Profiles"),
            onPressed: () {
              rnavigator.push(ProfileListPage.url,data: demoUsers);
            },
          ),
          // pageA,
        ],
      ),
    );
  }

  void demoFadeScale() {
    Future.delayed(Duration(milliseconds: 1200), () {
      fs.setVisible(false);
    });
    Future.delayed(Duration(milliseconds: 2200), () {
      fs.setVisible(true);
    });
  }
}

// ============================================================================
// EXEMPLES d'utilisation
// ============================================================================
class _Box extends Relement {
  final String text;
  final String color;
  _Box(this.text, this.color, {super.id});
  final html.Element d = html.DivElement();
  @override
  html.Element create() {
    d.text = text;
    d.style
      ..padding = '12px'
      ..borderRadius = '10px'
      ..color = '#111827'
      ..background = color;
    return d;
  }

  @override
  html.Element get getElement => create();
}

class _Card extends Relement {
  final String label;
  final String bg;
  final bool wide;
  _Card(this.label, this.bg, {this.wide = false, super.id});
  @override
  html.Element create() {
    final d = html.DivElement();
    d.style
      ..width = wide ? '320px' : '160px'
      ..height = wide ? '200px' : '120px'
      ..borderRadius = wide ? '20px' : '14px'
      ..background = bg
      ..display = 'flex'
      ..alignItems = 'center'
      ..justifyContent = 'center'
      ..fontWeight = '600';
    d.text = label;
    return d;
  }

  @override
  html.Element get getElement => create();
}
