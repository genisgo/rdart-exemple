import '../flutter_library.dart';

class TableViewExemple extends Rview {
  static final String url = "tableview";
  @override
  Relement build() {
    // TODO: implement build

    // -------------------- Démo ----------------------------------

    final data = [
      {
        'id': 1,
        'categorie': 'Audio',
        'produit': 'Casque Nova',
        'prix': 89.9,
        'stock': 24,
        'ajout': '2025-03-05',
      },
      {
        'id': 2,
        'categorie': 'Clavier',
        'produit': 'Atlas',
        'prix': 119.0,
        'stock': 12,
        'ajout': '2025-03-15',
      },
      {
        'id': 3,
        'categorie': 'Lumière',
        'produit': 'Lampe Halo',
        'prix': 39.5,
        'stock': 51,
        'ajout': '2025-04-02',
      },
      {
        'id': 4,
        'categorie': 'Montres',
        'produit': 'Air',
        'prix': 149.0,
        'stock': 7,
        'ajout': '2025-04-20',
      },
      {
        'id': 5,
        'categorie': 'Audio',
        'produit': 'Enceinte Boom',
        'prix': 59.9,
        'stock': 31,
        'ajout': '2025-05-01',
      },
      {
        'id': 6,
        'categorie': 'Audio',
        'produit': 'Casque Mini',
        'prix': 49.0,
        'stock': 40,
        'ajout': '2025-05-12',
      },
      {
        'id': 1,
        'categorie': 'Audio',
        'produit': 'Casque Nova',
        'prix': 89.9,
        'stock': 24,
        'ajout': '2025-03-05',
      },
      {
        'id': 2,
        'categorie': 'Clavier',
        'produit': 'Atlas',
        'prix': 119.0,
        'stock': 12,
        'ajout': '2025-03-15',
      },
      {
        'id': 3,
        'categorie': 'Lumière',
        'produit': 'Lampe Halo',
        'prix': 39.5,
        'stock': 51,
        'ajout': '2025-04-02',
      },
      {
        'id': 4,
        'categorie': 'Montres',
        'produit': 'Air',
        'prix': 149.0,
        'stock': 7,
        'ajout': '2025-04-20',
      },
      {
        'id': 5,
        'categorie': 'Audio',
        'produit': 'Enceinte Boom',
        'prix': 59.9,
        'stock': 31,
        'ajout': '2025-05-01',
      },
      {
        'id': 6,
        'categorie': 'Audio',
        'produit': 'Casque Mini',
        'prix': 49.0,
        'stock': 40,
        'ajout': '2025-05-12',
      },
    ];

    final cols = [
      const TableColumn(
        key: 'id',
        title: 'ID',
        type: DataType.number,
        align: 'right',
      ),
      const TableColumn(
        key: 'categorie',
        title: 'Catégorie',
        type: DataType.text,
      ),
      const TableColumn(key: 'produit', title: 'Produit', type: DataType.text),
      TableColumn(
        key: 'prix',
        title: 'Prix (€)',
        type: DataType.number,
        cellBuilder: (p0) => Text(p0["prix"].toString(), color: Colors.red),
        align: 'right',
        sum: false,
        filterable: true,
        format: (v) {
          final n = (v is num) ? v : double.tryParse('$v') ?? 0;
          return n.toStringAsFixed(2).replaceAll('.', ',');
        },
      ),
      const TableColumn(
        key: 'stock',
        title: 'Stock',
        type: DataType.number,
        align: 'right',
        sum: false,
      ),
      const TableColumn(key: 'ajout', title: 'Ajout', type: DataType.date),
    ];

    final table = TableView(
      data: data,
      columns: cols,
      showSearch: false,
      // groupByKey: 'categorie',
      initialPageSize: 5,
      pageSizeOptions: const [5, 10, 20, 50],
      theme: TableTheme(
        selectedBg: Colors.blue,
        headerBg: Colors.primary,
        headerFg: Colors.white,
        rowBg: Colors.white,
        altRowBg: Colors.yellow,
        borderColor: Colors.gray,
        hoverBg: Colors.blue,
        accent: Colors.graydark,
        radius: 14,
        lineHeight: 44,
        groupBg: Colors.blue,
        subtotalBg: Colors.green,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Table view Exemple")),
      body: Column(
        children: [
          Text("Liste des Produits"),
          SizedBox(height: 40),
          SizedBox(width: 1024, child: table),
        ],
      ),
    );
  }
}
