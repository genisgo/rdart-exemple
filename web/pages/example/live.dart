import "../../flutter_library.dart";
// On part du principe que ces classes existent déjà dans ton code,
// d'après ce qu'on a construit ensemble :
// - Scafoled, DefaultAppBar, AppBarActionButton
// - BottomNavigationBar, BottomNavItem
// - DefaultFloatingActionButton
// - DefaultDrawer, DefaultEndDrawer, DrawerHeader, DrawerListTile, RelementListGroup
// - Column, Row, Container, EdgeInsets, BoxDecoration, BorderRadius, Radius, Text, Padding, SizedBox
// - SegmentedControl, SegmentItem
// - TriToggleButton, TriState
// - ElevatedButton, OutlinedButton, TextButton, IconButton, ButtonGroup, etc. (optionnel)
// - Rapplication(...)

// ---------------------------------------------------------------
// Demo state/refs
// ---------------------------------------------------------------
class Live extends Rview {
  static final String url ="live";
  final controller = DrawerController();
  Scaffold? scafoled;
  @override
  Relement build() {
    scafoled = Scaffold(
      drawerController: controller,
      appBar: _buildAppBar(),
      body: _buildHome(),
      drawer: _buildLeftDrawer(),
      endDrawer: _buildRightDrawer(),
      bottomNavigationBar: _makeBnav(0),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Ouvrir le panneau',
        icon: BsIcon(icon: Bicon.sliders),
        onPressed: () => controller.toggleDrawer(),
      ),
      backgroundColor: '#f6f7fb',
    );
    return scafoled!;
  }

  late BottomNavigationBar _bnav;

  // ---------------------------------------------------------------
  // Body builders (3 onglets: Home / Stats / Settings)
  // ---------------------------------------------------------------
  Relement _buildHome() {
    return Column(
      gap: 12,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            'Bienvenue 👋',
            fontSize: 22,
            fontWeight: FontWeightCss.w600,
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.all(const Radius.circular(12)),
            boxShadow: const [
              BoxShadow(blurRadius: 16, color: 'rgba(0,0,0,.06)'),
            ],
          ),
          child: Column(
            gap: 8,
            children: [
              Text('Carte “Informations”', fontWeight: FontWeightCss.w600),
              Text(
                'Ceci est une petite carte de démonstration pour montrer comment nos widgets se composent.',
                color: Color('#495057'),
              ),
              Row(
                gap: 8,
                children: [
                  ElevatedButton(
                    label: Text('Action'),
                    onPressed: () => window.alert('Action cliquée'),
                  ),
                  OutlinedButton(
                    label: 'Annuler',
                    onPressed: () => window.alert('Annuler'),
                  ),
                  TextButton(
                    label: 'En savoir plus',
                    onPressed: () => window.alert('Plus d’infos'),
                    bootstrap: const ['text-primary'],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color('#f8f9fa'),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(
            'Astuce : ouvre le menu ≡ pour changer d’onglet depuis le Drawer.',
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Relement _buildStats() {
    // zone de contenu mise à jour par le SegmentedControl
    final dataBox = Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.White,
        borderRadius: BorderRadius.all(const Radius.circular(12)),
        boxShadow: const [BoxShadow(blurRadius: 16, color: 'rgba(0,0,0,.06)')],
      ),
      child: Column(
        gap: 6,
        children: [
          Text('Vue: Jour', fontWeight: FontWeightCss.w600),
          Text('Ici tu pourrais afficher un graphique, un tableau, etc.'),
        ],
      ),
    );

    Relement _panel(String title) => Column(
      gap: 6,
      children: [
        Text('Vue: $title', fontWeight: FontWeightCss.w600),
        Text('Contenu dynamique pour "$title".'),
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Color('#eef2ff'),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          alignment: Alignment.center,
          child: Text('Placeholder graphique'),
        ),
      ],
    );

    return Column(
      gap: 12,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            'Statistiques',
            fontSize: 20,
            fontWeight: FontWeightCss.w600,
          ),
        ),
        SegmentedControl(
          items: [
            SegmentItem(
              label: 'Jour',
              icon: BsIcon(icon: Bicon.sun),
            ),
            SegmentItem(
              label: 'Semaine',
              icon: BsIcon(icon: Bicon.calendarWeek),
            ),
            SegmentItem(
              label: 'Mois',
              icon: BsIcon(icon: Bicon.calendarMonth),
            ),
          ],
          currentIndex: 0,
          onChanged: (i) {
            if (i == 0) dataBox.setChild(_panel('Jour'));
            if (i == 1) dataBox.setChild(_panel('Semaine'));
            if (i == 2) dataBox.setChild(_panel('Mois'));
          },
        ),
        dataBox,
        SizedBox(height: 24),
      ],
    );
  }

  Relement _buildSettings() {
    final statusText = Text('Notifications : OFF', color: Color('#495057'));
    final toggle = TriToggleButton(
      label: 'Notifications',
      state: TriState.off,
      iconOff: BsIcon(icon: Bicon.bellSlashFill),
      iconOn: BsIcon(icon: Bicon.bell),
      iconIndeterminate: BsIcon(icon: Bicon.bellFill),
      onChanged: (s) {
        switch (s) {
          case TriState.off:
            statusText.setText('Notifications : OFF');
            break;
          case TriState.on:
            statusText.setText('Notifications : ON');
            break;
          case TriState.indeterminate:
            statusText.setText('Notifications : MIXTE');
            break;
        }
      },
    );

    return Column(
      gap: 12,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            'Paramètres',
            fontSize: 20,
            fontWeight: FontWeightCss.w600,
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:Colors.White,
            borderRadius: BorderRadius.all(const Radius.circular(12)),
            boxShadow: const [
              BoxShadow(blurRadius: 16, color: 'rgba(0,0,0,.06)'),
            ],
          ),
          child: Column(gap: 8, children: [statusText, toggle]),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  // ---------------------------------------------------------------
  // BottomNavigationBar factory + tab switching
  // ---------------------------------------------------------------
  BottomNavigationBar _makeBnav(int index) {
    return BottomNavigationBar(
      items: [
        BottomNavItem(
          label: 'Home',
          icon: BsIcon(icon: Bicon.house),
        ),
        BottomNavItem(
          label: 'Stats',
          icon: BsIcon(icon: Bicon.graphUp),
        ),
        BottomNavItem(
          label: 'Réglages',
          icon: BsIcon(icon: Bicon.gearWide),
        ),
      ],
      currentIndex: index,
      onTap: (i) => _switchTab(i),
    );
  }

  void _switchTab(int i) {
    switch (i) {
      case 0:
        scafoled?.setBody(_buildHome());
        break;
      case 1:
        scafoled?.setBody(_buildStats());
        break;
      case 2:
        scafoled?.setBody(_buildSettings());
        break;
    }
    // Remplacer la bottom bar pour refléter l’onglet actif
    _bnav = _makeBnav(i);
    scafoled?.setBottomBar(_bnav);
  }

  // ---------------------------------------------------------------
  // Drawers
  // ---------------------------------------------------------------
  DefaultDrawer _buildLeftDrawer() {
    return DefaultDrawer(
      title: 'Menu',
      children: [
        RelementListGroup(
          flush: true,
          children: [
            DrawerListTile(
              label: 'Accueil',
              icon: BsIcon(icon: Bicon.house),
              onTap: () {
                _switchTab(0);
                controller.closeDrawer();
              },
            ),
            DrawerListTile(
              label: 'Statistiques',
              icon: BsIcon(icon: Bicon.graphUp),
              onTap: () {
                _switchTab(1);
                controller.closeDrawer();
              },
            ),
            DrawerListTile(
              label: 'Paramètres',
              icon: BsIcon(icon: Bicon.gear),
              onTap: () {
                _switchTab(2);
                controller.closeDrawer();
              },
            ),
          ],
        ),
      ],
    );
  }

  DefaultEndDrawer _buildRightDrawer() {
    return DefaultEndDrawer(
      title: 'Panneau',
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            'Panneau latéral (EndDrawer)',
            fontWeight: FontWeightCss.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Tu peux y mettre des filtres, des infos contextuelles, etc.',
            color: Color('#495057'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12),
          child: ElevatedButton(
            label: Text('Fermer'),
            onPressed: () => scafoled?.closeEndDrawer(),
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------
  // AppBar builder
  // ---------------------------------------------------------------
  AppBar _buildAppBar() {
    return AppBar(
      title: 'Rdart Demo',
      leading: AppBarActionButton(
        label: '≡',
        title: 'Menu',
        onPressed: () => scafoled?.toggleDrawer(),
        bootstrap: const ['btn', 'btn-sm', 'btn-outline-secondary'],
      ),
      actions: [
        AppBarActionButton(
          label: 'Panel',
          onPressed: () => scafoled?.toggleEndDrawer(),
          bootstrap: const ['btn', 'btn-sm', 'btn-outline-primary'],
        ),
        AppBarActionButton(
          label: 'Sync',
          onPressed: () => window.alert('Synchronisation…'),
          bootstrap: const ['btn', 'btn-sm', 'btn-link'],
        ),
      ],
    );
  }
}
