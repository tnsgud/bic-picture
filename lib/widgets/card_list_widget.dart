import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final String title;
  final List<String> list;

  const CardList({
    super.key,
    required this.title,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemCount: list.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) => Text(
                    list[index],
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.scaffoldBackgroundColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
