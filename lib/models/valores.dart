
// To parse this JSON data, do
//
//     final valores = valoresFromJson(jsonString);

import 'dart:convert';

Valores valoresFromJson(String str) => Valores.fromJson(json.decode(str));

String valoresToJson(Valores data) => json.encode(data.toJson());

class Valores {
    Led led1;
    Led led2;
    Led led3;
    Led led4;

    Valores({
        required this.led1,
        required this.led2,
        required this.led3,
        required this.led4,
    });

    factory Valores.fromJson(Map<String, dynamic> json) => Valores(
        led1: Led.fromJson(json["led1"]),
        led2: Led.fromJson(json["led2"]),
        led3: Led.fromJson(json["led3"]),
        led4: Led.fromJson(json["led4"]),
    );

    Map<String, dynamic> toJson() => {
        "led1": led1.toJson(),
        "led2": led2.toJson(),
        "led3": led3.toJson(),
        "led4": led4.toJson(),
    };
}

class Led {
    int ldr;
    int state;

    Led({
        required this.ldr,
        required this.state,
    });

    factory Led.fromJson(Map<String, dynamic> json) => Led(
        ldr: json["ldr"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "ldr": ldr,
        "state": state,
    };
}


