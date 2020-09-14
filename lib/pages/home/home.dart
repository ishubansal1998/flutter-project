import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello/constants/config.dart';
import 'package:hello/pages/aboutus/aboutus.dart';
import 'package:hello/pages/coin_details/details.dart';
import 'package:hello/pages/settings/setting.dart';
import 'package:http/http.dart' as http;
import 'package:hello/model/model.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class Data {
  final int ind;
  final Coin coins;
  Data({this.ind, this.coins});
}

class Cointype {
  String typ;
  Cointype({this.typ});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isloading = false;
  int inr = 73;
  String types = 'USD';
  Coin coin;
  void fetchCoins() async {
    setState(() {
      isloading = true;
    });
    var res = await http.get(CMCConfig.url + CMCConfig.currencyEndpoint,
        headers: {"X-CMC_PRO_API_KEY": CMCConfig.accessToken});
    var decoded = jsonDecode(res.body);
    coin = Coin.fromJson(decoded);
    setState(() {
      isloading = false;
      //i++;
    });

    print(coin.status.timestamp);
    print(coin.data[1].symbol);
    print("\n");
  }

  @override
  void initState() {
    fetchCoins();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void updateInformation(String information) {
    setState(() => types = information);
  }

  Future navigateToSubPage(context) async {
    final cointype = Cointype(
      typ: types,
    );

    final type = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Setting(todo: cointype)),
    );
    updateInformation(type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('CRYPTO CURRENCY'), actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text("About Us"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Aboutus()),
                    );
                    //Navigator.pop(context);
                  },
                ),
                value: 0,
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    navigateToSubPage(context);
//Navigator.pop(context);
                  },
                ),
                value: 1,
              ),
            ],
          )
        ]),
        body: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: coin.data.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final data = Data(
                    ind: index,
                    coins: coin,
                  );
                  return InkWell(
                      child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => details(todo: data)),
                      );
                    },
                    leading: Image(
                      image: NetworkImage(
                          "https://s2.coinmarketcap.com/static/img/coins/64x64/${coin.data[index].id}.png"),
                      height: 40,
                      width: 40,
                    ),
                    title: Text('${coin.data[index].name}'),
                    subtitle: types == "USD"
                        ? Text("\$ "
                            '${coin.data[index].quote.usd.price.toStringAsFixed(2)}')
                        : Text("₹ "
                            '${double.parse(coin.data[index].quote.usd.price.toStringAsFixed(2)) * inr}'),
                  ));
                },
              ));
  }
}
