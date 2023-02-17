import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class EsStepperHeader extends StatelessWidget {
  const EsStepperHeader(
      {Key? key,
      required this.totalStps,
      required this.currentStep,
      required this.title,
      this.description})
      : super(key: key);

  final int totalStps;
  final int currentStep;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    const double estimatedHeight = 36 + 12 + 20;

    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      color: Theme.of(context).backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularStepProgressIndicator(
            totalSteps: totalStps,
            currentStep: currentStep,
            stepSize: 3,
            selectedColor: Theme.of(context).primaryColor,
            unselectedColor: Theme.of(context).disabledColor,
            padding: 0,
            width: estimatedHeight,
            height: estimatedHeight,
            selectedStepSize: 6,
            roundedCap: (_, __) => true,
            child: Center(
              child: Text('$currentStep of $totalStps',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      description ?? '',
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StepLeadingView extends StatelessWidget {
  const StepLeadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double estimatedHeight = 36 + 12 + 20 + 6;

    return Container(
      height: estimatedHeight,
      width: estimatedHeight,
      decoration:
          const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      child: Column(children: const [
        SizedBox(height: 16),
        Text(
          'Step',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '1/2',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
      ]),
    );
  }
}
