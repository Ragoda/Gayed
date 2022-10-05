class Cart {
  static List list = List.empty(growable: true);

  addCart(dynamic pos) {
    list.add(pos);
  }

  List getList() {
    return list;
  }

  removeItem(index) {
    list.removeAt(index);
  }
}
