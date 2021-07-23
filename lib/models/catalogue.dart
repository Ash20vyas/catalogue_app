class Item{
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imgURL;

  Item({this.id = "####", this.name = "NA", this.desc = "NA", this.price = 0, this.color = "NA", this.imgURL = "NA"});
}

final products = [
  Item(
    id: "Item#1",
    name: "iPhone 12 Pro",
    desc: "Apple iPhone 12th Gen",
    price: 999,
    color: "#33505a",
    imgURL: 
      "https://images.macrumors.com/t/r6zJD0ZIN9I_fzpPvWOfRNfWG2Y=/1733x/https://images.macrumors.com/article-new/2020/10/iphone12pro.jpg")
];