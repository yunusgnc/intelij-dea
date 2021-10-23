class Settings {
  String setting;
  String preference;
  Settings(String setting, String preference) {
    this.setting = setting;
    this.preference = preference;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["setting"] = setting;
    map["preference"] = preference;

    return map;
  }

  Settings.fromObject(dynamic o) {
    this.setting = (o["setting"]);
    this.preference = (o["preference"]);
  }
}
