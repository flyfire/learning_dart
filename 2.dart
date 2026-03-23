class Meta {
  double price;
  String name;

  Meta(this.name, this.price);
}

class Item extends Meta {
  Item(name, price): super(name, price);

  Item operator +(Item item) {
    return Item(name + item.name, price + item.price);
  }
}

mixin PrintHelper {
  getInfo();
  printInfo() => print(getInfo());
}

class ShoppingCart extends Meta with PrintHelper {
  DateTime date;
  String? code;
  List<Item> bookings;
  double get price => bookings.reduce((value, element) => value + element).price;
  ShoppingCart({name}) : this.withCode(name:name, code:null);
  ShoppingCart.withCode({name, this.code}) : date = DateTime.now(),bookings =[],super(name, 0);

  @override
  getInfo() {
    return """
购物车信息:
-----------------------------
  用户名: $name
  优惠码: ${code??"没有"}
  总价: $price
  Date: $date
-----------------------------
""";
  }
}

void main() {
  ShoppingCart.withCode(name: "张三", code: "123456")
  ..bookings = [Item("苹果", 10.0), Item("梨", 20.0)]
  ..printInfo();

  ShoppingCart(name: "李四")
  ..bookings = [Item("香蕉", 15.0), Item("西瓜", 40.0)]
  ..printInfo();
}