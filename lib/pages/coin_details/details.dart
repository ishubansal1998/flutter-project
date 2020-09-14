import "package:flutter/material.dart";
import "dart:convert";
import "package:hello/pages/home/home.dart";

class details extends StatelessWidget {
  final Data todo;
  details({Key key, @required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(todo.coins.data[todo.ind].name),
        ),
        body: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
              title: Text('Id : ${todo.coins.data[todo.ind].id}'),
            ),
            ListTile(
              title: Text('Name : ${todo.coins.data[todo.ind].name}'),
            ),
            ListTile(
              title: Text('Symbol : ${todo.coins.data[todo.ind].symbol}'),
            ),
            ListTile(
              title: Text('Slug : ${todo.coins.data[todo.ind].slug}'),
            ),
            ListTile(
              title: Text(
                  'numMarketPairs: ${todo.coins.data[todo.ind].numMarketPairs}'),
            ),
            ListTile(
              title:
                  Text('Date Added : ${todo.coins.data[todo.ind].dateAdded}'),
            ),
            ListTile(
              title:
                  Text('Max. Supply : ${todo.coins.data[todo.ind].maxSupply}'),
            ),
            ListTile(
              title: Text(
                  'circulating Supply : ${todo.coins.data[todo.ind].circulatingSupply}'),
            ),
            ListTile(
              title: Text(
                  'Total Supply : ${todo.coins.data[todo.ind].totalSupply}'),
            ),
            ListTile(
              title: Text('cmc Rank: ${todo.coins.data[todo.ind].cmcRank}'),
            ),
            ListTile(
              title: Text(
                  'Last updated : ${todo.coins.data[todo.ind].lastUpdated}'),
            ),
            ListTile(
              title:
                  Text('Cost: \$ ${todo.coins.data[todo.ind].quote.usd.price}'),
            ),
            ListTile(
                title: Center(
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Go BACk",
                        )))),
          ]).toList(),
        ));
  }
}
