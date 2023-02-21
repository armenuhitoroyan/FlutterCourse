import 'package:flutter/material.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          alignment: Alignment.centerLeft,
          child: Center(
            child: Column(
              children: [
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbSelector: (textDirection, values, tapValue,
                          thumbSize, trackSize, dx) {
                        if (tapValue == tapValue.clamp(0, 0.5)) {
                          return Thumb.start;
                        }
                        if (tapValue == tapValue.clamp(0.5, 1)) {
                          return Thumb.end;
                        }
                        return null;
                      },
                    ),
                    child: RangeSlider(
                      values: _currentRangeValues,
                      max: 100,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
