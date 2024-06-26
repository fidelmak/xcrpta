import 'package:flutter/material.dart';

import 'package:ably_flutter/ably_flutter.dart' as ably;

import '../../main.dart';
import '../provider/coin_provider.dart';
import '../service/ably_service.dart';
import 'dashboard.dart';
import 'widgets/coin_graph.dart';
import 'widgets/coin_list_item.dart';
import 'widgets/loading_container.dart';

class GraphList extends StatefulWidget {
  const GraphList({super.key});

  @override
  State<GraphList> createState() => _GraphListState();
}

class _GraphListState extends State<GraphList> {
  List<CoinUpdates> prices = [];

  @override
  void initState() {
    prices = getIt<AblyService>().getCoinUpdates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ably.ConnectionStateChange>(
      // As we are behind the FutureBuilder we can safely access AblyService
      stream: getIt<AblyService>().connection,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoadingContainer();
        } else if (snapshot.data?.event == ably.ConnectionEvent.connected) {
          // return the list of graphs,
          return SingleChildScrollView(
            child: Column(
              children: [
                for (CoinUpdates update in prices)
                  CoinListItem(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CoinGraph(coinUpdates: update);
                        },
                      ));
                    },
                    coinUpdates: update,
                  ),
              ],

              // see section below
            ),
          );
        } else if (snapshot.data?.event == ably.ConnectionEvent.failed) {
          return const Center(child: Text("No connection."));
        } else {
          // In a real app we would also add handling of possible errors
          return const LoadingContainer();
        }
      },
    );
  }
}
