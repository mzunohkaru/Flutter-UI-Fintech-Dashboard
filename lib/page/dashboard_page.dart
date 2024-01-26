import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_dashboard/widgets/item_service.dart';
import 'package:ui_dashboard/widgets/my_transaction.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<MyTransaction> receivedMoney = [
    MyTransaction('Aug', 35000),
    MyTransaction('Sep', 18000),
    MyTransaction('Oct', 27000),
    MyTransaction('Nov', 12500),
    MyTransaction('Dec', 57000),
  ];

  List<MyTransaction> sentMoney = [
    MyTransaction('Aug', 31000),
    MyTransaction('Sep', 48000),
    MyTransaction('Oct', 7000),
    MyTransaction('Nov', 6400),
    MyTransaction('Dec', 70000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ダッシュボード',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/user.jpg'),
              radius: 25,
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ユーザー',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ポイント 50p',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.white, letterSpacing: 1.5),
                    ),
                    const Icon(
                      CupertinoIcons.graph_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: LinearProgressIndicator(
                        value: .6,
                        backgroundColor: Colors.white54,
                        color: Colors.white,
                        minHeight: 5,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '60%',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '1日の使用限度額 10p',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'サービス',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemService(
                  title: '資産', iconData: Icons.wallet, color: Colors.red),
              ItemService(
                  title: '送金',
                  iconData: Icons.transform,
                  color: Colors.blue),
              ItemService(
                  title: '支払い', iconData: Icons.payment, color: Colors.yellow),
              ItemService(
                  title: 'チャージ',
                  iconData: Icons.money_outlined,
                  color: Colors.orange),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '統計',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          SfCartesianChart(
            margin: EdgeInsets.zero,
            primaryXAxis: const CategoryAxis(),
            legend: const Legend(isVisible: true),
            series: <CartesianSeries<MyTransaction, String>>[
              ColumnSeries(
                dataSource: receivedMoney,
                xValueMapper: (MyTransaction transaction, _) =>
                    transaction.month,
                yValueMapper: (MyTransaction transaction, _) =>
                    transaction.money,
                name: '入金',
              ),
              ColumnSeries(
                dataSource: sentMoney,
                xValueMapper: (MyTransaction transaction, _) =>
                    transaction.month,
                yValueMapper: (MyTransaction transaction, _) =>
                    transaction.money,
                name: '出金',
              ),
            ],
          )
        ],
      ),
    );
  }
}
