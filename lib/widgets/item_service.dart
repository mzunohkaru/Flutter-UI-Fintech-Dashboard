import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemService extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color color;

  const ItemService(
      {super.key,
      required this.title,
      required this.iconData,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, -8),
                  child: Container(
                    height: 5,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey
                    ),
                  ),
                ),
                Text(
                  '$titleする',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 15,
                  width: double.infinity,
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    iconData,
                    size: 250,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: color),
            child: Icon(iconData, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
