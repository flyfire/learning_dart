class Meta {
  double price;
  String name;

  Meta(this.name, this.price);
}

class Item extends Meta {
  int count;
  Item(name, price, this.count): super(name, price);

  Item operator +(Item item) {
    return Item(name + item.name, price*count + item.price*item.count, count + item.count);
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
名称 单价 个数 总价
${bookings.map((item) => "${item.name} ${item.price} ${item.count}, ${item.price*item.count}").join("\n")}
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
  ..bookings = [Item("苹果", 10.0, 2), Item("梨", 20.0, 3)]
  ..printInfo();

  ShoppingCart(name: "李四")
  ..bookings = [Item("香蕉", 15.0, 5), Item("西瓜", 40.0, 1)]
  ..printInfo();
}