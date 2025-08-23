import 'flutter_library.dart';
import 'pages/home_page.dart';
import 'pages/contenair_test.dart';
import 'pages/row_page.dart';
import 'pages/center_exemple.dart';
import 'pages/align_exemple.dart';
import 'pages/wrap_exemple.dart';
import 'pages/text_exemple.dart';
import 'pages/button_exemple.dart';
import 'pages/segmented_control_exemple.dart';
import 'pages/trie_toggle_button_exemple.dart';
import 'pages/example/live.dart';
import 'pages/stack_exemple.dart';
import 'pages/list_title_exemple.dart';
import 'pages/text_field_exemple.dart';
import 'pages/check_exemple.dart';
import 'pages/progress_indicator_exemple.dart';
import 'pages/forms_widgets_exemple.dart';
import 'pages/alert_dialog_exemple.dart';
import 'pages/animation_widgets_exemples.dart';
import 'pages/example/animation_hero_live.dart';
import 'pages/image_exemple.dart';
import 'pages/video_paler_exemple.dart';
import 'pages/carousel_exemple.dart';
import 'pages/toast_exemple.dart';
void main(List<String> args) {
  // une fois créés, on peut définir les callbacks de fermeture :
  // left.onRequestClose = () => ;
  // right.onRequestClose = () => ;

  Rapp(
    router: GoRouter(
      routes: [
        Rroute(url: ContenairTest.url, page: (data) => ContenairTest()),
        Rroute(url: RowPage.url, page: (data) => RowPage()),
        Rroute(url: CenterExemple.url, page: (data) => CenterExemple()),
        Rroute(url: CenterExemple.url, page: (data) => CenterExemple()),
        Rroute(url: AlignExemple.url, page: (data) => AlignExemple()),
        Rroute(url: WrapExemple.url, page: (data) => WrapExemple()),
        Rroute(url: TextExemple.url, page: (data) => TextExemple()),
        Rroute(url: ButtonExemple.url, page: (data) => ButtonExemple()),
        Rroute(
          url: SegmentedControlExemple.url,
          page: (data) => SegmentedControlExemple(),
        ),
        Rroute(
          url: TrieToggleButtonExemple.url,
          page: (data) => TrieToggleButtonExemple(),
        ),
        Rroute(url: StackExemple.url, page: (data) => StackExemple()),
        Rroute(url: Live.url, page: (data) => Live()),
        Rroute(url: ListTitleExemple.url, page: (data) => ListTitleExemple()),
        Rroute(url: TextFieldExemple.url, page: (data) => TextFieldExemple()),
        Rroute(
          url: ProgressIndicatorExemple.url,
          page: (data) => ProgressIndicatorExemple(),
        ),
        Rroute(url: CheckExemple.url, page: (data) => CheckExemple()),
        Rroute(
          url: FormsWidgetsExemple.url,
          page: (data) => FormsWidgetsExemple(),
        ),
        Rroute(
          url: AlertDialogExemple.url,
          page: (data) => AlertDialogExemple(),
        ),
        Rroute(
          url: AnimationWidgetsExemples.url,
          page: (data) => AnimationWidgetsExemples(),
        ),
        Rroute(
          url: ProfileListPage.url,
          page: (users) => ProfileListPage(users: users),
        ),
        Rroute(url: ImageExemple.url, page: (users) => ImageExemple()),
        Rroute(
          url: VideoPalerExemple.url,
          page: (users) => VideoPalerExemple(),
        ),
        Rroute(url: CarouselExemple.url, page: (users) => CarouselExemple()),
        Rroute(url: ToastExemple.url, page: (users) => ToastExemple()),
      ],
      home: Rroute(url: "/", page: (data) => HomePage()),
    ),
  );
}
