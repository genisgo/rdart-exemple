import '../flutter_library.dart';
import 'contenair_test.dart';
import 'row_page.dart';
import 'center_exemple.dart';
import 'align_exemple.dart';
import 'wrap_exemple.dart';
import 'text_exemple.dart';
import 'button_exemple.dart';
import 'segmented_control_exemple.dart';
import 'trie_toggle_button_exemple.dart';
import 'example/live.dart';
import 'stack_exemple.dart';
import 'list_title_exemple.dart';
import 'text_field_exemple.dart';
import 'check_exemple.dart';
import 'progress_indicator_exemple.dart';
import 'forms_widgets_exemple.dart';
import 'alert_dialog_exemple.dart';
import 'animation_widgets_exemples.dart';
import 'image_exemple.dart';
import 'video_paler_exemple.dart';
import 'carousel_exemple.dart';
import 'toast_exemple.dart';
import 'table_view_exemple.dart';

class HomePage extends Rview {
  final DrawerController controller = DrawerController();

  @override
  Relement build() {
    var body = _BodyBuilder(content: SizedBox());

    return Scaffold(
      drawerController: controller,
      appBar: AppBar(
        elevated: false,
        title: Text('Demo'),
        leading: AppBarActionButton(
          label: BsIcon(icon: Bicon.menuApp),
          title: 'Menu',
          onPressed: () => controller.openDrawer(),
        ),
        actions: [
          AppBarActionButton(
            label: BsIcon(icon: Bicon.badge3d),
            onPressed: () => controller.openEndDrawer(),
          ),
        ],
      ),
      drawer: DefaultDrawer(
        title: 'Menu',
        onRequestClose: () {
          controller.closeDrawer();
        },
        children: [
          // Un groupe “list-group” Bootstrap, par exemple :
          RelementListGroup(
            children: [
              DrawerListTile(
                label: 'Accueil',
                icon: BsIcon(icon: Bicon.house),
                onTap: () {
                  // ... ta navigation
                  controller.closeDrawer(); // ferme après action
                },
              ),
              _DrawerItem(title: "Exemple Container", url: ContenairTest.url),
              _DrawerItem(title: "Exemple Row", url: RowPage.url),
              _DrawerItem(title: "Exemple Center", url: CenterExemple.url),
              _DrawerItem(title: "Exemple Align", url: AlignExemple.url),
              _DrawerItem(title: "Exemple Wrap", url: WrapExemple.url),
              _DrawerItem(title: "Exemple Text", url: TextExemple.url),
              _DrawerItem(title: "Exemple Buttons", url: ButtonExemple.url),
              _DrawerItem(title: "Exemple Stack", url: StackExemple.url),
              _DrawerItem(
                title: "Exemple Segmented Control",
                url: SegmentedControlExemple.url,
              ),
              _DrawerItem(
                title: "Exemple TriToggle Button",
                url: TrieToggleButtonExemple.url,
              ),
              _DrawerItem(
                title: "Exemple ListTitle",
                url: ListTitleExemple.url,
              ),
              _DrawerItem(
                title: "Exemple Text Field",
                url: TextFieldExemple.url,
              ),
              _DrawerItem(
                title: "Exemple Check Exemple",
                url: CheckExemple.url,
              ),
              _DrawerItem(
                title: "Exemple ProgressIndicator",
                url: ProgressIndicatorExemple.url,
              ),
              _DrawerItem(title: "Exemple Comple", url: Live.url),
              _DrawerItem(
                title: "Exemple Forms Widgets",
                url: FormsWidgetsExemple.url,
              ),
              _DrawerItem(
                title: "Exemple Alert Dialog",
                url: AlertDialogExemple.url,
              ),
              _DrawerItem(
                title: "Exemple Animated Widgets",
                url: AnimationWidgetsExemples.url,
              ),
              _DrawerItem(
                title: "Exemple Image Widgets",
                url: ImageExemple.url,
              ),
              _DrawerItem(
                title: "Exemple Video Player",
                url: VideoPalerExemple.url,
              ),
              _DrawerItem(title: "Carousel Exemple", url: CarouselExemple.url),
              _DrawerItem(title: "Toast Exemple", url: ToastExemple.url),
              _DrawerItem(
                title: "TableView Exemple",
                url: TableViewExemple.url,
              ),
            ],
          ),
        ],
      ),
      endDrawer: DefaultEndDrawer(
        title: 'Panneau',
        onRequestClose: () {
          controller.closeEndDrawer();
        },
        children: [
          DrawerListTile(
            label: 'Profil',
            icon: BsIcon(icon: Bicon.person),
            onTap: () {
              controller.closeEndDrawer();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavItem(
            label: 'Home',
            icon: BsIcon(icon: Bicon.house),
          ),
          BottomNavItem(
            label: 'Search',
            icon: BsIcon(icon: Bicon.search),
          ),
          BottomNavItem(
            label: 'Profile',
            icon: BsIcon(icon: Bicon.person),
          ),
        ],
        onTap: (index) {
          body.setContent(  Text("index $index"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Ajouter',
        onPressed: () => window.alert('FAB'),
        icon: BsIcon(icon: Bicon.plusLg),
      ),
      body: body,
    );
  }

  DrawerListTile _DrawerItem({required String title, required String url}) {
    return DrawerListTile(
      label: title,
      icon: BsIcon(icon: Bicon.gear), //'<i class="bi bi-gear"></i>',
      onTap: () {
        // ... ta navigation
        rnavigator.push(url);
        controller.closeDrawer();
      },
    );
  }
}

class _BodyBuilder extends Rview {
  Relement content;
  _BodyBuilder({required this.content});
  @override
  Relement build() {
    // TODO: implement build
    return Center(expand: AlignExpand.width, child:  content);
  }

  void setContent(Relement newContent) {
    content = newContent;
    setState(() {});
  }
}
