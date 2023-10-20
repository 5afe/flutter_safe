import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_safe/balances/balances_bloc.dart';
import 'package:http/http.dart' as http;

import 'balances_list.dart';

class BalancesPage extends StatelessWidget {
  const BalancesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coins')),
      body: BlocProvider(
        create: (context) => BalancesBloc(
          httpClient: http.Client(), 
          chainId: "1",
          safeAddress: "0x84443F61efc60D10DA9F9a2398980CD5748394BB", 
          fiatCode: "usd", 
          trusted: false, 
          excludeSpam: true
        )..add(BalancesFetched()),
        child: const BalancesList(),
      )
    );
  }
}

class BalancesList extends StatefulWidget {
  const BalancesList({super.key});

  @override
  State<StatefulWidget> createState() => _BalancesListState();
}

class _BalancesListState extends State<BalancesList> {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalancesBloc, BalancesState>(
      builder: (context, state) {
        switch (state.status) {
          case BalancesStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case BalancesStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case BalancesStatus.success:
            if (state.list.items.isEmpty) {
              return const Center(child: Text('empty balance'));
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return BalancesListItem(item: state.list.items[index]);  
              },
              itemCount: state.list.items.length
            );
        }
      }
    );    
  }
}

class BalancesListItem extends StatelessWidget {
  const BalancesListItem({required this.item, super.key});

  final BalanceItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${item.tokenInfo.symbol}', style: textTheme.bodySmall),
        title: Text(item.tokenInfo.name),
        isThreeLine: true,
        subtitle: Text('${item.balance} (${item.fiatBalance} USD)'),
      )
    );
  }
}
