part 'store_ext_1.dart';
part 'store_ext_2.dart';

class Store {
  /// id of the store. - main-hcs-operations(pass)
  final String? id;
  final List<StoreOffering>? offerings;

  Store({required this.id, required this.offerings});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      offerings: json['offerings'] != null
          ? List<StoreOffering>.from(
              json['offerings'].map((offer) => StoreOffering.fromJson(offer)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'offerings': offerings?.map((offering) => offering.toJson()).toList(),
    };
  }

  @override
  String toString() => 'id: $id, offerings: $offerings';
}
