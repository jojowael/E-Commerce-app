// /// message : "fail"
// /// errors : {"value":"0120079918","msg":"accept only egypt phone numbers","param":"phone","location":"body"}
//
// class Error {
//   Error({
//       this.message,
//       this.errors,});
//
//   Error.fromJson(dynamic json) {
//     message = json['message'];
//     errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
//   }
//   String? message;
//   Errors? errors;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['message'] = message;
//     if (errors != null) {
//       map['errors'] = errors?.toJson();
//     }
//     return map;
//   }
//
// }

/// value : "0120079918"
/// msg : "accept only egypt phone numbers"
/// param : "phone"
/// location : "body"

class ErrorJojo {
  ErrorJojo({
    this.value,
    this.msg,
    this.param,
    this.location,
  });

  ErrorJojo.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  String? value;
  String? msg;
  String? param;
  String? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['msg'] = msg;
    map['param'] = param;
    map['location'] = location;
    return map;
  }
}
