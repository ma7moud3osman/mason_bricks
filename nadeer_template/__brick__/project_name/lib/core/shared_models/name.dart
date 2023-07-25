// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Name {
  late final String ar;
  late final String en;

  Name({
    required this.ar,
    required this.en,
  });

  Map<String, dynamic> toJson();

  Name copyWith({
    String? ar,
    String? en,
  });

  @override
  bool operator ==(covariant Name other) {
    if (identical(this, other)) return true;

    return other.ar == ar && other.en == en;
  }

  @override
  int get hashCode => ar.hashCode ^ en.hashCode;
}
