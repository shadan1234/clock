class Set_of_time{
  int hour, minute;
  String am_pm;
  String button;
  bool font;
  String path;
  int? id;

  Set_of_time({this.id,required this.hour,required this.minute,required this.am_pm,required this.button,required this.font,required this.path});
  static  Set_of_time fromJson(Map<String, dynamic> json) {
    return Set_of_time(
 id: json['id'],
      hour: json['hour'],
      minute: json['minute'],
      am_pm: json['am_pm'],
      button: json['button'],
      font: json['font'] == 1,
      path: json['path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'hour': hour,
      'minute': minute,
      'am_pm': am_pm,
      'button': button,
      'font': font ? 1 : 0,
      'path': path,
    };
  }
void toggle()
{
  if(button=='on')
  {
    button='off';
    font=false;
  }
  else
{    button='on';
  font=true;
  }
}
}