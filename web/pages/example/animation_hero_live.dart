import 'dart:html' as html;

import '../../flutter_library.dart';

// ----------------------- Modèle factice
class User {
  final String id;
  final String name;
  final String photoUrl;
  User(this.id, this.name, this.photoUrl);
}

final demoUsers = <User>[
  User('u1', 'Alice', 'https://picsum.photos/id/64/300/300'),
  User('u2', 'Benoît', 'https://picsum.photos/id/1027/300/300'),
  User('u3', 'Chloé', 'https://picsum.photos/id/1025/300/300'),
];

// ----------------------- Avatar avec Container (pas de <div>)
class Avatar extends Rview {
  final String url;
  final double size;
  final double radius;
  Avatar({required this.url, this.size = 56, this.radius = 999, super.id});

  @override
  Relement build() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        // tu peux ajouter une bordure/ombre si besoin
        // : 'transparent',
        // borderWidth: 1,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: _ImageFill(url),
    );
  }
}

class _ImageFill extends Relement {
  final String src;
  _ImageFill(this.src, {super.id});
  final img = html.ImageElement();
  @override
  html.Element create() {
    img
      ..src = src
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.objectFit = 'cover'
      ..draggable = false;
    return img;
  }

  @override
  // TODO: implement getElement
  html.Element get getElement => img;
}

// ----------------------- Page Liste
class ProfileListPage extends Rview {
  static final String url = "heroProfile";
  final List<User> users;
  ProfileListPage({required this.users, super.id});

  @override
  Relement build() {
    final items = users.map((u) {
      final tag = 'profile:${u.id}';
      return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color('#0f172aCC'),
          borderRadius: BorderRadius.all(Radius.circular(14)),
          border: Border(all: BorderSide(color: MaterialColor(255,255,255,.06))),
        ),
        child: Row(
          gap: 12,
          children: [
            // Avatar HERO (petit)
            Hero(
              tag: tag,
              child: Avatar(url: u.photoUrl, size: 56),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                gap: 4,
                children: [
                  Text(
                    u.name,
                    fontSize: 16,
                    fontWeight: FontWeightCss.w600,
                    // style: const TextStyle(
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.w600,
                    // ),
                  ),
                  Text(
                    'Touchez pour voir le profil',
                    color: MaterialColor.fromHex('#94a3b8'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              label: Text("Voir"),
              onPressed: () {
                // transition personnalisée : Hero
                var to = ProfileDetailPage(user: u);
                to.create();
                Future.delayed(Duration(microseconds: 500), () {
                  HeroAnimator.transition(
                    fromPage: getElement,
                    toPage: to.getElement,
                    tag: tag,
                    durationMs: 420,
                    fadePages: true,
                    animateBorderRadius: true,
                  );
                });
                // HeroAnimator.transition(
                //   fromPage: getElement,
                //   toPage: to.getElement,
                //   tag: tag,
                //   durationMs: 2000,
                //   fadePages: false,
                //   animateBorderRadius: true,
                // );
                rnavigator.routes.add(
                  Rroute(url: ProfileDetailPage.url, page: (user) => to),
                );

                rnavigator.push(ProfileDetailPage.url);
              },
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: 'Contacts'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(gap: 12, children: items),
      ),
    );
  }
}

// ----------------------- Page Détail
class ProfileDetailPage extends Rview {
  static final String url = "detailProfile";
  final User user;
  ProfileDetailPage({required this.user, super.id});

  @override
  Relement build() {
    final tag = 'profile:${user.id}';

    final header = Column(
      gap: 12,
      children: [
        // Avatar HERO (grand)
        Hero(
          tag: tag,
          child: Avatar(url: user.photoUrl, size: 160),
        ),
        Text(user.name, fontSize: 20, fontWeight: FontWeightCss.w700),

        Text('Designer • Bamako', color: MaterialColor.fromHex('#94a3b8')),
      ],
    );

    final actions = Row(
      gap: 8,
      children: [
        ElevatedButton(label: Text('Message'), onPressed: () {}),
        OutlinedButton(label: 'Appeler', onPressed: () {}),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: 'Profil',
        leading: TextButton(
          label: 'Retour',
          onPressed: () {
            rnavigator.pop(
              // transition: (from, to) => HeroAnimator.transition(
              //   fromPage: from,
              //   toPage: to,
              //   tag: tag, // même tag pour l’anim retour
              //   durationMs: 320,
              //   fadePages: true,
              //   animateBorderRadius: true,
              // ),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(gap: 16, children: [header, actions]),
      ),
    );
  }
}
