import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello/constants/config.dart';
import 'package:http/http.dart' as http;
import 'package:hello/model/model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isloading = false;
  String m = "";
  int i = 0;
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
      m = coin.data[i].name;
      isloading = false;
      i++;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Crypto Currency')),
        body: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: coin.data.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image(
                      image: NetworkImage(
                          "https://s2.coinmarketcap.com/static/img/coins/64x64/${coin.data[index].id}.png"),
                      height: 40,
                      width: 40,
                    ),
                    title: Text('${coin.data[index].name}'),
                    subtitle: Text("\$ "
                        '${coin.data[index].quote.usd.price.toStringAsFixed(2)}'),
                  );
                },
              ));
  }
}
