class CatalogModel{

  static final items = [Item(
  id: 1,
  name: 'iphone 12 pro',
  desc: 'Apple iphone 12th generation',
  price: 999,
  color: '#33505a',
  image: 'https://esquilo.io/png/thumb/qPzuyx74KDmVVJ3-Apple-iPhone-12-PNG-Photos.png'

)
];

}


class Item{
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}

