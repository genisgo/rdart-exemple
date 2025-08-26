import '../flutter_library.dart';

class ListTitleExemple extends Rview {
  static final String url = "list-title";
  @override
  Relement build() {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("ListTitle Exemple")),
      body: Column(
        children: [
          SizedBox(height: 20),
          RListTile(bootstrap: [Bborder.rounded4,],
            leading: BsIcon(icon: Bicon.person),
            title: 'John Doe',
            subtitle: 'Clique pour ouvrir le profil',
            trailing: BsIcon(icon: Bicon.chevronRight),
            onTap: () => print('open'),
          ),
        ],
      ),
    );
  }
}
