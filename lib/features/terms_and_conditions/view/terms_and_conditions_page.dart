// ignore_for_file: must_be_immutable
import 'package:auto_route/annotations.dart';
import 'package:diagnostic_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class TermsAndConditionPage extends StatelessWidget {
  final String contentBody;
  const TermsAndConditionPage({super.key, required this.contentBody});

  @override
  Widget build(BuildContext context) {
    return TermAndConditionView(
      contentBody: contentBody,
    );
  }
}

class TermAndConditionView extends ConsumerStatefulWidget {
  final String contentBody;
  const TermAndConditionView({super.key, required this.contentBody});

  @override
  ConsumerState<TermAndConditionView> createState() => _TermAndConditionViewState();
}

class _TermAndConditionViewState extends ConsumerState<TermAndConditionView> {
  @override
  Widget build(BuildContext context) {
    double fontSize = ResponsiveValue<double>(
      context,
      conditionalValues: [
        Condition.equals(name: MOBILE, value: Theme.of(context).textTheme.bodyLarge?.fontSize),
        Condition.equals(name: TABLET, value: Theme.of(context).textTheme.titleMedium?.fontSize),
        Condition.equals(name: DESKTOP, value: Theme.of(context).textTheme.titleLarge?.fontSize),
        Condition.equals(name: '4K', value: Theme.of(context).textTheme.titleLarge?.fontSize),
      ],
    ).value;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "About Us",
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: HtmlWidget(
          // the first parameter (`html`) is required
          widget.contentBody,

          // all other parameters are optional, a few notable params:

          // specify custom styling for an element
          // see supported inline styling below
          customStylesBuilder: (element) {
            if (element.classes.contains('foo')) {
              return {'color': 'red'};
            }

            return null;
          },

          customWidgetBuilder: (element) {
            if (element.attributes['foo'] == 'bar') {
              // render a custom block widget that takes the full width
            }

            return null;
          },

          // select the render mode for HTML body
          // by default, a simple `Column` is rendered
          // consider using `ListView` or `SliverList` for better performance
          renderMode: RenderMode.column,

          // set the default styling for text
          textStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
