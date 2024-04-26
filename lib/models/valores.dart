// To parse this JSON data, do
//
//     final ledResponse = ledResponseFromJson(jsonString);

import 'dart:convert';

LedResponse ledResponseFromJson(String str) => LedResponse.fromJson(json.decode(str));

String ledResponseToJson(LedResponse data) => json.encode(data.toJson());

// class LedResponse {
//     Led led1;
//     Led led2;
//     Led led3;
//     Led led4;

//     LedResponse({
//         required this.led1,
//         required this.led2,
//         required this.led3,
//         required this.led4,
//     });

//     factory LedResponse.fromJson(Map<String, dynamic> json) => LedResponse(
//         led1: Led.fromJson(json["led1"]),
//         led2: Led.fromJson(json["led2"]),
//         led3: Led.fromJson(json["led3"]),
//         led4: Led.fromJson(json["led4"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "led1": led1.toJson(),
//         "led2": led2.toJson(),
//         "led3": led3.toJson(),
//         "led4": led4.toJson(),
//     };
// }

class LedResponse {
    int ldr;
    int state;
    String? id;

    LedResponse({
        required this.ldr,
        required this.state,
        this.id
    });

    factory LedResponse.fromJson(Map<String, dynamic> json) => LedResponse(
        ldr: json["ldr"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "ldr": ldr,
        "state": state,
    };

    LedResponse copy() => LedResponse(
      ldr: ldr, 
      state: state,
      id: id
    );
}
