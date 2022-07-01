import 'package:flutter/material.dart';
import 'package:ui_challenge/info_cards.dart';

class BlockDeal extends StatefulWidget {
  const BlockDeal({Key? key}) : super(key: key);

  @override
  State<BlockDeal> createState() => _BlockDealState();
}

class _BlockDealState extends State<BlockDeal> {
  final myNotifier = ValueNotifier<ButtonTapOptions>(ButtonTapOptions.all);

  var allCards = cards;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        right: 12,
        left: 12,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () {
                  myNotifier.value = ButtonTapOptions.all;
                },
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size.fromWidth(115),
                  backgroundColor: Colors.indigo[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'All',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  myNotifier.value = ButtonTapOptions.buy;
                },
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size.fromWidth(115),
                  backgroundColor: Colors.green[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Buy',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  myNotifier.value = ButtonTapOptions.sell;
                },
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size.fromWidth(115),
                  backgroundColor: Colors.red[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Sell',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Search Client Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
          const Divider(
            height: 50,
            thickness: 5,
            color: Colors.white,
          ),
          Expanded(
            child: ValueListenableBuilder<ButtonTapOptions>(
              builder: (context, value, _) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    switch (value.name) {
                      case 'sell':
                        final cardlist = cards
                            .where((card) =>
                                card.shareTransactionInfo.split(' ').first ==
                                'Sold')
                            .toList();
                        final cardInfo = cardlist[index];
                        return CardBlock(cardInfo: cardInfo);
                      case 'buy':
                        final cardlist = cards
                            .where((card) =>
                                card.shareTransactionInfo.split(' ').first ==
                                'Bought')
                            .toList();
                        final cardInfo = cardlist[index];
                        return CardBlock(cardInfo: cardInfo);
                      default:
                        final cardInfo = cards[index];
                        return CardBlock(cardInfo: cardInfo);
                    }
                  },
                  itemCount: cards.length,
                );
              },
              valueListenable: myNotifier,
            ),
          ),
        ],
      ),
    );
  }
}

class CardBlock extends StatelessWidget {
  const CardBlock({required this.cardInfo, Key? key}) : super(key: key);

  final InfoCard cardInfo;

  @override
  Widget build(BuildContext context) {
    final transactionActivity = cardInfo.shareTransactionInfo.split(' ').first;
    return Card(
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              VerticalDivider(
                color: transactionActivity == 'Sold'
                    ? Colors.green[300]
                    : Colors.red,
                thickness: 3,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cardInfo.title),
                        Text(
                          cardInfo.date,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      cardInfo.shareTransactionInfo,
                      style: TextStyle(
                        color: transactionActivity == 'Sold'
                            ? Colors.green[300]
                            : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      cardInfo.value,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ButtonTapOptions { all, buy, sell }
