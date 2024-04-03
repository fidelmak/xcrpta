import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wx_tile/wx_tile.dart';
import 'package:xcrpta/utils/colors.dart';
import 'package:cryptofont/cryptofont.dart';
import 'package:http/http.dart' as http;

class PriceList extends StatefulWidget {
  const PriceList({
    super.key,
  });

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  Map<String, dynamic> cryptoPrices = {};
  Future<Map<String, dynamic>> fetchCryptoPrices() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load cryptocurrency prices');
    }
  }

  void initState() {
    super.initState();
    fetchPrices();
  }

  Future<void> fetchPrices() async {
    try {
      final Map<String, dynamic> prices = await fetchCryptoPrices();
      setState(() {
        cryptoPrices = prices;
      });
    } catch (e) {
      print('Error fetching prices: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WxListTile(
          title: const Text('Bitcoin'),
          subtitle: const Text('price'),
          leading: Icon(CryptoFontIcons.fromSymbol("BTC")),
          trailing: Text(
            ' \$  ${cryptoPrices['bitcoin']['usd']}',
            style: const TextStyle(fontSize: 30, color: Colors.amber),
          ),
          textColor: primaryColor,
          iconColor: Colors.amber,
          margin: const EdgeInsets.all(15),
          onTap: () {},
        ),
        WxListTile(
          title: const Text('Bitcoin'),
          subtitle: const Text('price'),
          leading: Icon(CryptoFontIcons.fromSymbol("ETH")),
          trailing: Text(
            ' \$  ${cryptoPrices['ethereum']['usd']}',
            style: const TextStyle(fontSize: 30, color: Colors.amber),
          ),
          textColor: primaryColor,
          iconColor: Colors.amber,
          margin: const EdgeInsets.all(15),
          onTap: () {},
        ),
        WxListTile(
          title: const Text('Bitcoin'),
          subtitle: const Text('price'),
          leading: Icon(CryptoFontIcons.fromSymbol("BTC")),
          trailing: Text(
            ' \$  ${cryptoPrices['solona']['usd']}',
            style: const TextStyle(fontSize: 30, color: Colors.amber),
          ),
          textColor: primaryColor,
          iconColor: Colors.amber,
          margin: const EdgeInsets.all(15),
          onTap: () {},
        ),
      ],
    );
  }
}
