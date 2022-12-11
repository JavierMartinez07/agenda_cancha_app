class Tiempo {
  double temp_c;
  double temp_f;
  Condition condition;
  Tiempo(this.temp_c, this.temp_f, this.condition);

  Tiempo.fromJson(Map<String, dynamic> json)
      : temp_c = json['temp_c'],
        temp_f = json['temp_f'],
        condition = Condition.fromJson(json['condition']);

  Map<String, dynamic> toJson() => {
        'temp_c': temp_c,
        'temp_f': temp_f,
        'condition': condition,
      };
}

class Condition {
  String text;
  String icon;
  int code;

  Condition(
    this.text,
    this.icon,
    this.code,
  );

  Condition.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        icon = json['icon'],
        code = json['code'];

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
        'code': code,
      };
}
