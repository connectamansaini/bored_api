import 'package:bored/src/bored/bloc/bored_bloc.dart';
import 'package:bored/src/core/domain/enums.dart';
import 'package:bored/src/core/presentation/colors.dart';
import 'package:bored/src/core/presentation/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Try it out'),
        ),
        body: BlocBuilder<BoredBloc, BoredState>(
          builder: (context, state) {
            if (state.boredDataStatus == BoredDataStatus.failure) {
              return const Center(child: Text('Something went Wrong'));
            }
            if (state.boredDataStatus == BoredDataStatus.success) {
              return const HomeBody();
            }
            return const CircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<BoredBloc>().add(
                BoredDataRequested(),
              ),
          child: const Icon(Icons.new_label),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<BoredBloc, BoredState>(
            builder: (context, state) {
              return Column(
                children: [
                  Text(
                    'Activity: ${state.bored.activity}',
                    style: Theme.of(context).smallTitlePrimaryTextStyle,
                  ),
                  Text(
                    'Type: ${state.bored.type}',
                    style: Theme.of(context).smallTitlePrimaryTextStyle,
                  ),
                  Text(
                    'Participants: ${state.bored.participants}',
                    style: Theme.of(context).smallTitlePrimaryTextStyle,
                  ),
                  Text(
                    'Price: ${state.bored.price}',
                    style: Theme.of(context).smallTitlePrimaryTextStyle,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Link : ',
                          style: Theme.of(context).smallTitlePrimaryTextStyle,
                        ),
                        TextSpan(
                          text: state.bored.link,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrl(Uri.parse(state.bored.link));
                            },
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Accessibility: ${state.bored.accessibility}',
                    style: Theme.of(context).smallTitlePrimaryTextStyle,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
