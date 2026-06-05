import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yes_madam/controller/search/search_controller.dart' as search;
import 'package:yes_madam/widgets/common/common_text.dart';
import 'search_service_card.dart';

class SearchResultsWidget extends StatelessWidget {
  final search.SearchController controller;

  const SearchResultsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final results = controller.filteredServices;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(18.w, 28.h, 18.w, 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Top results for "${controller.query.value}"',
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: results.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 235.h,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 24.h,
            ),
            itemBuilder: (_, i) {
              final service = results[i];
              return SearchServiceCard(
                service: service,
                index: controller.indexOfService(service),
                counts: controller.serviceCounts,
                onAdd: controller.incrementService,
                onMinus: controller.decrementService,
                onTap: () => controller.openService(service),
              );
            },
          ),
        ],
      ),
    );
  }
}