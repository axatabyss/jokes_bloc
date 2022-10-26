// To parse this JSON data, do
//
//     final jokesModel = jokesModelFromJson(jsonString);

import 'dart:convert';

JokesModel jokesModelFromJson(String str) => JokesModel.fromJson(json.decode(str));

String jokesModelToJson(JokesModel data) => json.encode(data.toJson());

class JokesModel {
    JokesModel({
        this.error,
        this.category,
        this.type,
        this.setup,
        this.delivery,
        this.flags,
        this.safe,
        this.id,
        this.lang,
    });

    bool? error;
    String? category;
    String? type;
    String? setup;
    String? delivery;
    Flags? flags;
    bool? safe;
    int? id;
    String? lang;

    factory JokesModel.fromJson(Map<String, dynamic> json) => JokesModel(
        error: json["error"] == null ? null : json["error"],
        category: json["category"] == null ? null : json["category"],
        type: json["type"] == null ? null : json["type"],
        setup: json["setup"] == null ? null : json["setup"],
        delivery: json["delivery"] == null ? null : json["delivery"],
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
        safe: json["safe"] == null ? null : json["safe"],
        id: json["id"] == null ? null : json["id"],
        lang: json["lang"] == null ? null : json["lang"],
    );

    Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "category": category == null ? null : category,
        "type": type == null ? null : type,
        "setup": setup == null ? null : setup,
        "delivery": delivery == null ? null : delivery,
        "flags": flags == null ? null : flags?.toJson(),
        "safe": safe == null ? null : safe,
        "id": id == null ? null : id,
        "lang": lang == null ? null : lang,
    };
}

class Flags {
    Flags({
        this.nsfw,
        this.religious,
        this.political,
        this.racist,
        this.sexist,
        this.explicit,
    });

    bool? nsfw;
    bool? religious;
    bool? political;
    bool? racist;
    bool? sexist;
    bool? explicit;

    factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        nsfw: json["nsfw"] == null ? null : json["nsfw"],
        religious: json["religious"] == null ? null : json["religious"],
        political: json["political"] == null ? null : json["political"],
        racist: json["racist"] == null ? null : json["racist"],
        sexist: json["sexist"] == null ? null : json["sexist"],
        explicit: json["explicit"] == null ? null : json["explicit"],
    );

    Map<String, dynamic> toJson() => {
        "nsfw": nsfw == null ? null : nsfw,
        "religious": religious == null ? null : religious,
        "political": political == null ? null : political,
        "racist": racist == null ? null : racist,
        "sexist": sexist == null ? null : sexist,
        "explicit": explicit == null ? null : explicit,
    };
}
