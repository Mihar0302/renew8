import 'package:ReNew8/presentation/widgets/stepper.dart';
import 'package:flutter/cupertino.dart';

class CustomStper extends StatefulWidget {
  final int currentStep;

  const CustomStper({
    Key? key,
    required this.currentStep,
  }) : super(key: key);

  @override
  State<CustomStper> createState() => _CustomStperState();
}

class _CustomStperState extends State<CustomStper> {
  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      currentStep: 0,
      onStepTapped: (step) {
        setState(() {
          // currentStep = step;
        });
      },
      onStepContinue: () {
        setState(() {
          if (widget.currentStep < 5) {
            // currentStep += 1;
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if (widget.currentStep > 5) {
            // currentStep -= 1;
          }
        });
      },
      steps: [
        Step(
          state:
              widget.currentStep > 1 ? StepState.complete : StepState.disabled,
          isActive: widget.currentStep > 1,
          title: Container(),
          content: Container(),
        ),
        Step(
          state:
              widget.currentStep > 2 ? StepState.complete : StepState.disabled,
          isActive: widget.currentStep > 2,
          title: Container(),
          content: Container(),
        ),
        Step(
          state:
              widget.currentStep > 3 ? StepState.complete : StepState.disabled,
          isActive: widget.currentStep > 3,
          title: Container(),
          content: Container(),
        ),
        Step(
          state:
              widget.currentStep > 4 ? StepState.complete : StepState.disabled,
          isActive: widget.currentStep > 4,
          title: Container(),
          content: Container(),
        ),
        Step(
          state:
              widget.currentStep > 5 ? StepState.complete : StepState.disabled,
          isActive: widget.currentStep > 5,
          title: Container(),
          content: Container(),
        ),
      ],
    );
  }
}
