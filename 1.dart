printInteger(int a) {
    print("Hello world, this is $a.");
}

main() {
    var number = 2026;
    printInteger(number);
    var s = 'cat';
    var s1 = "this is a uppercased string: ${s.toUpperCase()}";
    print(s1);
    var name = "solarex";
    var age = 18;
    var info = "my name is $name, and I am $age years old.";
    print(info);
    var s2 = """this is a multi-line string,
     and it can contain 'single quotes' and \"double quotes\" without escaping.";""";
    print(s2);
    var arr1 = ["Tom", "Andy", "Jack"];
    var arr2 = List.of([1, 2, 3]);
    arr2.add(499);
    // arr2.add(1.1);
    arr2.forEach((element) {
        print(element);
    });
    arr2.forEach((v) => print(v));

    var map1 = {"name": "solarex", "age": 18};
    var map2 = new Map();
    map2["name"] = "solarex";
    map2["sex"] = "male";
    map2.forEach((k, v) => print("$k: $v"));
    map2.forEach((k, v) {
        print("$k: $v");
    });
    map1.forEach((k, v) => print("$k: $v"));
}