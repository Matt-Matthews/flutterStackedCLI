import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stackedtest/ui/common/app_colors.dart';
import 'package:stackedtest/ui/common/ui_helpers.dart';
import 'package:stackedtest/ui/views/home/home_view.form.dart';

import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'searchTerms'),
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.createSql();
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: kcBackgroundColor,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kcPrimaryColor,
          onPressed: viewModel.navigateToMap,
          child: const Icon(
            Icons.map,
            color: Colors.white,
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SizedBox(
              child: viewModel.isBusy
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextField(
                            controller: searchTermsController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Search books by category',
                              hintStyle: TextStyle(color: kcLightGrey),
                            ),
                            onSubmitted: (value) async {
                              viewModel.fetchNewCategory();
                            },
                          ),
                          verticalSpaceMedium,
                          SizedBox(
                            height: screenHeight(context) * 0.77,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: viewModel.data?.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  final book = viewModel.data?[index];
                                  return Card(
                                    color: kcDarkGreyColor,
                                    child: ListTile(
                                      title: Text(
                                        book?.title ?? 'no book',
                                        style: const TextStyle(
                                            color: kcVeryLightGrey),
                                      ),
                                      onTap: () =>
                                          viewModel.navigateToBook(book: book!),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    )),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
