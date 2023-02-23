import 'package:big_picture/constants/gaps.dart';
import 'package:big_picture/constants/sizes.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget with Sizes, Gaps {
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
      height: size96,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(size10),
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
                  padding: EdgeInsets.all(size0),
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
