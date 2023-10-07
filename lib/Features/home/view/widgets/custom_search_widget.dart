import 'package:astama/Features/home/view/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    FocusScopeNode currentFocus = FocusScope.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
          controller: controller,
          onTapOutside: (event) {
            if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
          },
          textInputAction: TextInputAction.search,
          onChanged: (value) =>
              context.read<HomeBloc>().add(SearchEvent(value)),
          onSubmitted: (value) =>
              context.read<HomeBloc>().add(SearchEvent(value)),
          decoration: InputDecoration(
              filled: true,
              hintText: 'أبحث عن قارئ',
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is SearchReciterListSuccess) {
                    return IconButton(
                      onPressed: () {
                        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
                        controller.clear();
                        context.read<HomeBloc>().add(FetchReciterList());
                      },
                      icon: Icon(Icons.close, color: AppColor.kPrimaryColor),
                    );
                  } else {
                    return Icon(Icons.search_rounded,
                        color: AppColor.kPrimaryColor);
                  }
                },
              ),
             // fillColor: Colors.grey.shade50,
              contentPadding: const EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(18)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)))),
    );
  }
}
