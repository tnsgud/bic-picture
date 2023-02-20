import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final List<String> weekly = '일,월,화,수,목,금,토'.split(',');
  final List<String> days = '6,7,8,9,10,11,12'.split(',');

  String selectedDay = '';
  List<int> test = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      child: Container(
        height: 350,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...weekly
                    .map(
                      (e) => SizedBox(
                        width: 30,
                        height: 30,
                        child: Text(
                          e,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                    .toList()
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: days.map((e) => dayText(e, theme)).toList(),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            test.isEmpty
                ? Text(
                    '일정이 없습니다.',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: test.length,
                      itemBuilder: (context, index) => Text(
                        '${test[index]}',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget dayText(String e, ThemeData theme) {
    const number = 1;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedDay = selectedDay == e ? '' : e;
              test = number <= 5 && selectedDay.isNotEmpty
                  ? List.generate(5, (index) => index + int.parse(selectedDay))
                  : [];
            });
          },
          child: SizedBox(
            width: 30,
            height: 30,
            child: Container(
              decoration: selectedDay == e
                  ? BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    )
                  : null,
              child: Text(
                e,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (number <= 5)
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
          )
      ],
    );
  }
}
