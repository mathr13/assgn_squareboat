class Option {
  final String title;
  final bool isSelected;

  Option({required this.title, required this.isSelected});

  // Option.fromJson(Map<String, dynamic> json) {
  //   title = json['title'];
  //   isSelected = json['isSelected'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['title'] = title;
  //   data['isSelected'] = isSelected;
  //   return data;
  // }
}
