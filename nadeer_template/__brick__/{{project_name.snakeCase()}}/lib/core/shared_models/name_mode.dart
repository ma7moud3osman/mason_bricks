import 'name.dart';

class NameModel extends Name {
  NameModel({
    required super.ar,
    required super.en,
  });

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
      ar: json['ar'],
      en: json['en'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ar'] = ar;
    data['en'] = en;
    return data;
  }

  @override
  Name copyWith({String? ar, String? en}) {
    return NameModel(
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }
}
