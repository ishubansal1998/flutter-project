// To parse this JSON data, do
//
//     final coin = coinFromJson(jsonString);

import 'dart:convert';

class Coin {
  Coin({
    this.status,
    this.data,
  });

  Status status;
  List<Datum> data;

  factory Coin.fromRawJson(String str) => Coin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        status: Status.fromJson(json["status"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.numMarketPairs,
    this.dateAdded,
    this.tags,
    this.maxSupply,
    this.circulatingSupply,
    this.totalSupply,
    this.platform,
    this.cmcRank,
    this.lastUpdated,
    this.quote,
  });

  int id;
  String name;
  String symbol;
  String slug;
  int numMarketPairs;
  DateTime dateAdded;
  List<String> tags;
  double maxSupply;
  double circulatingSupply;
  double totalSupply;
  Platform platform;
  int cmcRank;
  DateTime lastUpdated;
  Quote quote;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        numMarketPairs: json["num_market_pairs"],
        dateAdded: DateTime.parse(json["date_added"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        maxSupply:
            json["max_supply"] == null ? null : json["max_supply"].toDouble(),
        circulatingSupply: json["circulating_supply"].toDouble(),
        totalSupply: json["total_supply"].toDouble(),
        platform: json["platform"] == null
            ? null
            : Platform.fromJson(json["platform"]),
        cmcRank: json["cmc_rank"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        quote: Quote.fromJson(json["quote"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "num_market_pairs": numMarketPairs,
        "date_added": dateAdded.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "max_supply": maxSupply == null ? null : maxSupply,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "platform": platform == null ? null : platform.toJson(),
        "cmc_rank": cmcRank,
        "last_updated": lastUpdated.toIso8601String(),
        "quote": quote.toJson(),
      };
}

class Platform {
  Platform({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.tokenAddress,
  });

  int id;
  Name name;
  Symbol symbol;
  Slug slug;
  String tokenAddress;

  factory Platform.fromRawJson(String str) =>
      Platform.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        id: json["id"],
        name: nameValues.map[json["name"]],
        symbol: symbolValues.map[json["symbol"]],
        slug: slugValues.map[json["slug"]],
        tokenAddress: json["token_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "symbol": symbolValues.reverse[symbol],
        "slug": slugValues.reverse[slug],
        "token_address": tokenAddress,
      };
}

enum Name { ETHEREUM, BINANCE_COIN, TRON }

final nameValues = EnumValues({
  "Binance Coin": Name.BINANCE_COIN,
  "Ethereum": Name.ETHEREUM,
  "TRON": Name.TRON
});

enum Slug { ETHEREUM, BINANCE_COIN, TRON }

final slugValues = EnumValues({
  "binance-coin": Slug.BINANCE_COIN,
  "ethereum": Slug.ETHEREUM,
  "tron": Slug.TRON
});

enum Symbol { ETH, BNB, TRX }

final symbolValues =
    EnumValues({"BNB": Symbol.BNB, "ETH": Symbol.ETH, "TRX": Symbol.TRX});

class Quote {
  Quote({
    this.usd,
  });

  Usd usd;

  factory Quote.fromRawJson(String str) => Quote.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: Usd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
      };
}

class Usd {
  Usd({
    this.price,
    this.volume24H,
    this.percentChange1H,
    this.percentChange24H,
    this.percentChange7D,
    this.marketCap,
    this.lastUpdated,
  });

  double price;
  double volume24H;
  double percentChange1H;
  double percentChange24H;
  double percentChange7D;
  double marketCap;
  DateTime lastUpdated;

  factory Usd.fromRawJson(String str) => Usd.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        price: json["price"].toDouble(),
        volume24H: json["volume_24h"].toDouble(),
        percentChange1H: json["percent_change_1h"].toDouble(),
        percentChange24H: json["percent_change_24h"].toDouble(),
        percentChange7D: json["percent_change_7d"] == null
            ? null
            : json["percent_change_7d"].toDouble(),
        marketCap: json["market_cap"].toDouble(),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "volume_24h": volume24H,
        "percent_change_1h": percentChange1H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D == null ? null : percentChange7D,
        "market_cap": marketCap,
        "last_updated": lastUpdated.toIso8601String(),
      };
}

class Status {
  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
    this.totalCount,
  });

  DateTime timestamp;
  int errorCode;
  dynamic errorMessage;
  int elapsed;
  int creditCount;
  dynamic notice;
  int totalCount;

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
        notice: json["notice"],
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
        "total_count": totalCount,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
