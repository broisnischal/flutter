import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage(name: 'StepperPageRoute')
class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  final scrollController = ScrollController();

  // void nextStep() {
  //   if (formKey.currentState!.validate()) {
  //     if (currentStep < 2) {
  //       setState(() => currentStep++);
  //     } else {
  //       // `TODO`: Add logic to save data
  //       showSnackBar(context, 'Data saved successfully');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool App'),
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Colors.orange),
        ),
        child: Form(
          key: formKey,
          child: Stepper(
            type: StepperType.horizontal,
            connectorThickness: 2,
            controller: scrollController,
            // margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            // stepIconBuilder: (stepIndex, stepState) {
            //   final displayIndex = stepIndex + 1;
            //   return Container(
            //     height: 50,
            //     width: 50,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: stepState == StepState.complete
            //           ? Colors.orange
            //           : Colors.transparent,
            //     ),
            //     child: Center(
            //       child: Text(displayIndex.toString().padLeft(2, '0')),
            //     ),
            //   );
            // },
            physics: const ScrollPhysics(),
            key: const Key('stepper'),
            steps: getSteps(),
            onStepTapped: (int step) => setState(() => currentStep = step),
            currentStep: currentStep,
            elevation: 0,
            onStepContinue: () {
              setState(() {
                if (currentStep < getSteps().length - 1) {
                  currentStep = currentStep + 1;
                } else {
                  // last step
                  // if (formKey.currentState!.validate()) {
                  //   showSnackBar(
                  //     context: context,
                  //     title: 'Error',
                  //     content: 'Please fill all the fields',
                  //   );
                  // }
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    showDragHandle: true,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    builder: (context) => IntrinsicHeight(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: SingleChildScrollView(
                          child: Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Wrap(
                                  spacing: 10.w,
                                  runSpacing: 10.h,
                                  children: [
                                    ...List.filled(21, const Text('data'))
                                        .asMap()
                                        .entries
                                        .map(
                                          (entry) => Container(
                                            height: 100,
                                            width: 100,
                                            decoration: const BoxDecoration(
                                              color: Colors.orange,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'data ${entry.key}',
                                              ), // Using entry.key as the index
                                            ),
                                          ),
                                        ),
                                  ],
                                ),
                                20.verticalSpace,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );

                  // context.router.maybePop();
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (currentStep > 0) {
                  currentStep = currentStep - 1;
                } else {
                  context.router.maybePop();
                }
              });
            },
            controlsBuilder: (context, details) {
              final isLastStep = currentStep == getSteps().length - 1;

              return Container(
                margin: const EdgeInsets.only(top: 20),
                // child: Row(
                //   children: [
                //     ElevatedButton(
                //       onPressed: details.onStepContinue,
                //       child: const Text('Next'),
                //     ),
                //     const SizedBox(width: 10),
                // TextButton(
                //   onPressed: details.onStepCancel,
                //   child: const Text('Back'),
                // ),
                //   ],
                // ),
                child: ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: Text(!isLastStep ? 'Continue' : 'Send Notification'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 && nameController.text.isNotEmpty
              ? StepState.complete
              : StepState.indexed,
          label: const Text('From'),
          // subtitle: Text('step 1'),
          title: Container(),
          content: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: nameController,
              ),
            ],
          ),
          isActive: currentStep >= 0,
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          label: const Text('Person'),
          title: Container(),
          content: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                controller: emailController,
              ),
            ],
          ),
          isActive: currentStep >= 1,
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          label: const Text('Flat'),
          title: Container(),
          content: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Address'),
                controller: addressController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                controller: passwordController,
              ),
            ],
          ),
          isActive: currentStep >= 2,
        ),
        // Step(
        //   state: currentStep > 3 ? StepState.complete : StepState.indexed,
        //   label: const Text('Flat'),
        //   title: Container(),
        //   content: Column(
        //     children: [
        //       TextFormField(
        //         decoration: const InputDecoration(labelText: 'Address'),
        //         controller: addressController,
        //       ),
        //       TextFormField(
        //         decoration: const InputDecoration(labelText: 'Password'),
        //         controller: passwordController,
        //       ),
        //     ],
        //   ),
        //   isActive: currentStep >= 3,
        // ),
      ];
}
