// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:yes_madam/controller/about_us/about_us_controller.dart';
// import 'package:yes_madam/utils/app_colors.dart';
// import 'package:yes_madam/utils/app_font_sizes.dart';
// import 'package:yes_madam/utils/app_font_weights.dart';
// import 'package:yes_madam/utils/app_texts.dart';
// import 'package:yes_madam/widgets/components/spacing_widget.dart';
// import 'package:yes_madam/widgets/yes_madam_logo.dart';
//
// class AboutUsScreen extends GetView<AboutUsController> {
//   const AboutUsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Get.back(),
//         ),
//         title: Text(
//           AppTexts.aboutUsTitle,
//           style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       backgroundColor: AppColors.whiteColor,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildHeaderSection(),
//             const SizedBox(height: 27),
//             _buildWhyYesMadamSection(),
//             const SizedBox(height: 24),
//             _buildCoreBeliefsSection(),
//             const SizedBox(height: 24),
//             _buildServicesSection(),
//             const SizedBox(height: 20),
//             _buildMilestonesSection(),
//             const SizedBox(height: 24),
//             _buildWhatsNewSection(),
//             const SizedBox(height: 24),
//             _buildLifeAtYesMadam(),
//             const SizedBox(height: 24),
//             _buildTeamSection(),
//             const SizedBox(height: 24),
//             _buildSharkTankBanner(),
//             const SizedBox(height: 24),
//             _buildCitiesSection(),
//             const SizedBox(height: 24),
//             _buildFooterSection(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeaderSection() {
//     return Column(
//       children: [
//         Center(
//           child: Column(
//             children: [
//               YesMadamLogo(height: 30.h, width: 160.w),
//               const Text(
//                 AppTexts.salonExpertHomeDelivery,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           AppTexts.aboutUsTitle,
//           style: TextStyle(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.bold,
//             color: AppColors.blackColor,
//           ),
//         ),
//         Spacing.height(4),
//         Center(
//           child: Divider(
//             height: 1.3.h,
//             thickness: 2.3,
//             endIndent: 160,
//             indent: 160,
//             color: AppColors.dividerBlueColor,
//           ),
//         ),
//         const SizedBox(height: 10),
//         RichText(
//           textAlign: TextAlign.center,
//           text: TextSpan(
//             style: TextStyle(
//               color: AppColors.blackColor,
//               fontSize: AppFontSizes.fontSmall,
//             ),
//             children: [
//               const TextSpan(
//                 text:
//                     "Imagine your friends made a plan last minute and now you’re stressing about what to wear because the waxing is not done, your nails are chipped and eyebrows are no less than bushes. So, you end up wearing a makeshift outfit, the nails are still chipped & you try to fix your brows with makeup. Ugh! Right? Well not anymore because we are here to give you ",
//               ),
//               TextSpan(
//                 text: AppTexts.salonExpertHomeDelivery,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const TextSpan(
//                 text:
//                     " when you desire & that too at the most affordable prices.\n\n",
//               ),
//
//               const TextSpan(
//                 text:
//                     "It's the 21st Century, if we can shop for groceries from the comfort of our homes why not book a professional to ",
//               ),
//               TextSpan(
//                 text: "get beauty and salon services at home.",
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildWhyYesMadamSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Center(
//           child: Text(
//             AppTexts.whyYesMadam,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: AppFontWeights.semiBold,
//               color: AppColors.blackColor,
//             ),
//           ),
//         ),
//         Center(
//           child: Divider(
//             height: 1.3.h,
//             thickness: 2.3,
//             endIndent: 160,
//             indent: 160,
//             color: AppColors.dividerBlueColor,
//           ),
//         ),
//         SizedBox(height: 16),
//         _customInfoCard(
//           title: AppTexts.convenience,
//           cardColor: AppColors.lightPink,
//           borderColor: AppColors.themeColor,
//           description:
//               'With the fast-paced lives, it becomes tiresome to fit into the schedule of salons. Yes Madam professionals fit into your schedule and reach your doorsteps at your convenience. All you gotta do is book an appointment via our website or mobile application.',
//         ),
//         _customInfoCard(
//           title: AppTexts.transparency,
//           cardColor: AppColors.lightPink,
//           borderColor: AppColors.themeColor,
//           description:
//               "We believe in utmost honesty and transparency when it comes to pricing our services. We divide the total charges separately as service charge and product cost. So, you know what you’re paying and why.",
//         ),
//         _customInfoCard(
//           title: AppTexts.hygiene,
//           cardColor: AppColors.lightPink,
//           borderColor: AppColors.themeColor,
//           description:
//               "After the pandemic hit our world all of us have become more conscious of hygiene and sanitisation. Thus our professionals bring disposables for every service. These ensure that your service is done in the most hygienic manner and that no-mess is created at your place. Moreover, we use mono-use kits for the services which means every time the professional opens a fresh packet for the service and handovers leftover products to the customer.",
//         ),
//         _customInfoCard(
//           title: 'Freedom to use own products',
//           cardColor: AppColors.lightPink,
//           borderColor: AppColors.themeColor,
//           description:
//               "Yes Madam is India’s first salon-at-home platform that gives its customers the freedom to use their own products. In this case you only pay the service charge which starts at ₹6/min.",
//         ),
//       ],
//     );
//   }
//
//   Widget _buildCoreBeliefsSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Center(
//           child: Text(
//             AppTexts.ourCoreBeliefs,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: AppFontWeights.semiBold,
//               color: AppColors.blackColor,
//             ),
//           ),
//         ),
//         Center(
//           child: Divider(
//             height: 1.3.h,
//             thickness: 2.3,
//             endIndent: 160,
//             indent: 160,
//             color: AppColors.dividerBlueColor,
//           ),
//         ),
//         SizedBox(height: 20),
//         _customInfoCard(
//           title: AppTexts.mission,
//           cardColor: AppColors.lightPeachColor,
//           borderColor: AppColors.softPeachBrown,
//           description:
//               'With the fast-paced lives, it becomes tiresome to fit into the schedule of salons. Yes Madam professionals fit into your schedule and reach your doorsteps at your convenience. All you gotta do is book an appointment via our website or mobile application.',
//         ),
//         _customInfoCard(
//           title: AppTexts.vision,
//           cardColor: AppColors.lightPeachColor,
//           borderColor: AppColors.softPeachBrown,
//           description:
//               "We believe in utmost honesty and transparency when it comes to pricing our services. We divide the total charges separately as service charge and product cost. So, you know what you’re paying and why.",
//         ),
//         _customInfoCard(
//           title: AppTexts.philosophy,
//           cardColor: AppColors.lightPeachColor,
//           borderColor: AppColors.softPeachBrown,
//           description:
//               "After the pandemic hit our world all of us have become more conscious of hygiene and sanitisation. Thus our professionals bring disposables for every service. These ensure that your service is done in the most hygienic manner and that no-mess is created at your place. Moreover, we use mono-use kits for the services which means every time the professional opens a fresh packet for the service and handovers leftover products to the customer.",
//         ),
//         _customInfoCard(
//           title:AppTexts.values,
//           cardColor: AppColors.lightPeachColor,
//           borderColor: AppColors.softPeachBrown,
//           description:
//               "Yes Madam is India’s first salon-at-home platform that gives its customers the freedom to use their own products. In this case you only pay the service charge which starts at ₹6/min.",
//         ),
//       ],
//     );
//   }
//
//   Widget _buildServicesSection() {
//     return Column(
//       children: [
//         Text(
//           'Services we offer',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: AppColors.blackColor,
//           ),
//         ),
//         Center(
//           child: Divider(
//             height: 1.3.h,
//             thickness: 2.3,
//             endIndent: 160,
//             indent: 160,
//             color: AppColors.dividerBlueColor,
//           ),
//         ),
//         SizedBox(height: 55),
//         _serviceCard(
//           'Female Salon at Home',
//           'https://www.yesmadam.com/_next/image?url=https%3A%2F%2Fcdn.yesmadam.com%2Fimages%2Flive%2Fwebsite%2Fimages%2Freact%2Fpublic-assets%2Fsalon-at-home.png&w=640&q=75',
//           "We provide a range of beauty services at the comfort of your home. From waxing, facials, clean-ups and mani-pedi to body polishing and even hair spa, you name it we have it.",
//         ),
//         _serviceCard(
//           'Female Spa at Home',
//           'https://www.yesmadam.com/_next/image?url=https%3A%2F%2Fcdn.yesmadam.com%2Fimages%2Flive%2Fwebsite%2Fimages%2Freact%2Fpublic-assets%2Fspa-at-home.png&w=640&q=75',
//           "Whether you want to de-stress yourself or get a pain-relieving body massage we have everything in the bucket for you. With this we also cater the needs of elderly, new moms, kids & period pain.",
//         ),
//         _serviceCard(
//           'Female HydraGlo & Laser Treatments',
//           'https://www.yesmadam.com/_next/image?url=https%3A%2F%2Fcdn.yesmadam.com%2Fimages%2Flive%2Fwebsite%2Fimages%2Fbeauty-chat-images%2FhydraLaser.webp&w=640&q=75',
//           "As our skin matures, it needs more to maintain its health and glow. Our HydraGlo at Home are perfect for you if you want instant results with a healthy glow while our at home Laser Treatments are great for hair reduction, pigmentation correction, and skin rejuvenation.",
//         ),
//         _serviceCard(
//           'Male Grooming',
//           "https://www.yesmadam.com/_next/image?url=https%3A%2F%2Fcdn.yesmadam.com%2Fimages%2Flive%2Fwebsite%2Fimages%2Freact%2Fmale-grooming.webp&w=640&q=75",
//           "Why should women have all the pampering? Our salon at home services are available for men too. We know how specific men are for their beard and hair cuts. Hence, we offer different packages to cater their needs. With this we offer facials, clean-ups, charcoal face mask, de-tan packs and hair spa. Life isn’t perfect, but your skin and hair can be. So, book right away!",
//         ),
//         _serviceCard(
//           'Male Spa',
//           "https://www.yesmadam.com/_next/image?url=https%3A%2F%2Fcdn.yesmadam.com%2Fimages%2Flive%2Fwebsite%2Fimages%2Freact%2Fmale-spa.webp&w=640&q=75",
//           "With too much adventure and too much work comes too much tiredness. And we’ve got just the right spa services for you. Whether it is sport’s injury, muscle pain or just stress, you’ll get a solution to every concern. Our best seller full body bamboo massage therapy is perfect to relieve every kind of body pain and tiredness. While our de-stress therapy ensures you’re relaxed and rejuvenated.",
//         ),
//       ],
//     );
//   }
//
//   Widget _buildMilestonesSection() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
//       color: Colors.white,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: controller.milestoneData
//                 .take(2)
//                 .map((e) => _milestoneItem(e))
//                 .toList(),
//           ),
//
//           const SizedBox(height: 20),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: controller.milestoneData
//                 .skip(2)
//                 .take(2)
//                 .map((e) => _milestoneItem(e))
//                 .toList(),
//           ),
//
//           const SizedBox(height: 20),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _milestoneItem(controller.milestoneData[4]),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _milestoneItem(Map<String, dynamic> data) {
//     return SizedBox(
//       width: 110,
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.pink.withOpacity(0.12),
//                   Colors.pink.withOpacity(0.01),
//                 ],
//               ),
//             ),
//             child: Center(
//               child: Icon(data['icon'], size: 28, color: Colors.black87),
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             data['value'],
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//               letterSpacing: 0.5,
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             data['label'],
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//               height: 1.2,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildWhatsNewSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//          Text(
//           "What's New",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.blackColor),
//         ),
//         Center(
//           child: Divider(
//             height: 1.3.h,
//             thickness: 2.3,
//             endIndent: 160,
//             indent: 160,color: AppColors.dividerBlueColor,
//           ),
//         ),
//         const SizedBox(height: 20),
//         Container(
//           width: double.infinity,
//           height: 400.h,
//           decoration: BoxDecoration(
//             color: Colors.black87,
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLifeAtYesMadam() {
//     return Column(
//       children: [
//          Text(
//           'Life at Yes Madam',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.blackColor),
//         ),
//         const SizedBox(height: 10),
//         Center(
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.pinkAccent),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Text(
//               "WE DON'T DO AVERAGE, WE DO YAYSOME",
//               style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTeamSection() {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Text(
//               'Our founding team',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Colors.grey[300],
//             ), // Profile Image placeholder
//             const SizedBox(height: 8),
//             const Text(
//               'Aditya Arya',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               'Co-founder & COO',
//               style: TextStyle(color: Colors.grey),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'The dynamic and determined younger brother of Mayank followed his elder brother\'s footsteps...',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 13),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSharkTankBanner() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.amber[50],
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.amber),
//       ),
//       child: const Column(
//         children: [
//           Text(
//             'SHARK TANK INDIA FEATURED',
//             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Secures Rs 1.5 Crore funding on Shark Tank India',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCitiesSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'We Are Live In 50+ Cities',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         Wrap(
//           spacing: 8,
//           runSpacing: 4,
//           children: controller.cities
//               .map(
//                 (city) => Chip(
//                   label: Text(city, style: const TextStyle(fontSize: 12)),
//                 ),
//               )
//               .toList(),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildFooterSection() {
//     return const Column(
//       children: [
//         Divider(),
//         SizedBox(height: 8),
//         Text('Quick Links', style: TextStyle(fontWeight: FontWeight.bold)),
//         SizedBox(height: 8),
//         Text(
//           'Privacy Policy  |  Terms & Conditions  |  Contact Us',
//           style: TextStyle(color: Colors.blue, fontSize: 13),
//         ),
//         SizedBox(height: 16),
//         Text('Facing issues? Reach out at:', style: TextStyle(fontSize: 12)),
//         Text(
//           'support@yesmadam.com',
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
//         ),
//         SizedBox(height: 16),
//         Text(
//           'Copyright 2017-2026 @YesMadam',
//           style: TextStyle(color: Colors.grey, fontSize: 11),
//         ),
//       ],
//     );
//   }
//
//   Widget _customInfoCard({
//     String? title,
//     String? description,
//     Color? cardColor,
//     Color? borderColor,
//   }) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       color: cardColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//         side: BorderSide(color: borderColor ?? AppColors.greyColor, width: 1.5),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title ?? "",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.blackColor,
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               description ?? "",
//               style: TextStyle(color: Colors.black87, fontSize: 13),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _customBeliefTile(String title, String desc) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//           ),
//           Text(
//             desc,
//             style: const TextStyle(color: Colors.black54, fontSize: 13),
//           ),
//           const Divider(),
//         ],
//       ),
//     );
//   }
//
//   Widget _serviceCard(String title, String imgUrl, String desc) {
//     return Column(
//       children: [
//         Image.network(imgUrl, width: double.infinity, fit: BoxFit.cover),
//         Padding(
//           padding: EdgeInsets.all(30.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: AppFontWeights.semiBold,
//                   color: AppColors.blackColor,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 desc,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: AppColors.greyColor,
//                   fontSize: 12.sp,
//                   fontWeight: AppFontWeights.normal,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _milestoneTile(String count, String label) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.purple[50],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             count,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.purple,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yes_madam/controller/about_us/about_us_controller.dart';
import 'package:yes_madam/utils/app_colors.dart';
import 'package:yes_madam/utils/app_dimensions.dart';
import 'package:yes_madam/utils/app_font_sizes.dart';
import 'package:yes_madam/utils/app_font_weights.dart';
import 'package:yes_madam/utils/app_texts.dart';
import 'package:yes_madam/widgets/common/common_text.dart';
import 'package:yes_madam/widgets/components/spacing_widget.dart';
import 'package:yes_madam/widgets/yes_madam_logo.dart';

class AboutUsScreen extends GetView<AboutUsController> {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: () => Get.back(),
        ),
        title: CommonText(
          text: AppTexts.aboutUsTitle,
          color: AppColors.blackColor,
          fontWeight: AppFontWeights.bold,
          fontSize: AppFontSizes.fontXMedium,
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            SizedBox(height: AppDimensions.paddingLarge + AppDimensions.spacingSmall),
            _buildWhyYesMadamSection(),
            SizedBox(height: AppDimensions.paddingLarge),
            _buildCoreBeliefsSection(),
            SizedBox(height: AppDimensions.paddingLarge),
            _buildServicesSection(),
            SizedBox(height: AppDimensions.paddingXMedium),
            _buildMilestonesSection(),
            SizedBox(height: AppDimensions.paddingLarge),
            _buildWhatsNewSection(),
            SizedBox(height: AppDimensions.paddingLarge),
            _buildLifeAtYesMadam(),
            SizedBox(height: AppDimensions.paddingLarge),
            _buildTeamSection(),
            SizedBox(height: AppDimensions.paddingLarge),
            _buildSharkTankBanner(),
            SizedBox(height: AppDimensions.paddingLarge),
            _buildCitiesSection(),
            SizedBox(height: AppDimensions.paddingLarge),
            _buildFooterSection(),
          ],
        ),
      ),
    );
  }

  // ── Header ──────────────────────────────────────────────────────────────────

  Widget _buildHeaderSection() {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              YesMadamLogo(height: 30.h, width: 160.w),
              CommonText(
                text: AppTexts.salonExpertHomeDelivery,
                color: AppColors.blackColor,
                fontWeight: AppFontWeights.medium,
                fontSize: AppFontSizes.fontMedium,
              ),
            ],
          ),
        ),
        SizedBox(height: AppDimensions.paddingXMedium),
        CommonText(
          text: AppTexts.aboutUsTitle,
          fontSize: AppFontSizes.fontLarge - 2,
          fontWeight: AppFontWeights.bold,
          color: AppColors.blackColor,
        ),
        Spacing.height(AppDimensions.spacingSmall),
        Center(
          child: Divider(
            height: 1.3.h,
            thickness: 2.3,
            endIndent: 160,
            indent: 160,
            color: AppColors.dividerBlueColor,
          ),
        ),
        SizedBox(height: AppDimensions.paddingSmall),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: AppFontSizes.fontSmall,
            ),
            children: [
              TextSpan(text: AppTexts.aboutUsIntroPrefix),
              TextSpan(
                text: AppTexts.salonExpertHomeDelivery,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: AppTexts.aboutUsIntroSuffix),
              TextSpan(text: AppTexts.aboutUsIntro2Prefix),
              TextSpan(
                text: AppTexts.aboutUsIntro2Bold,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Why Yes Madam ───────────────────────────────────────────────────────────

  Widget _buildWhyYesMadamSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CommonText(
            text: AppTexts.whyYesMadam,
            fontSize: AppFontSizes.fontLarge,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.blackColor,
          ),
        ),
        Center(
          child: Divider(
            height: 1.3.h,
            thickness: 2.3,
            endIndent: 160,
            indent: 160,
            color: AppColors.dividerBlueColor,
          ),
        ),
        const SizedBox(height: 16),
        ...controller.whyYesMadamCards.map(
              (card) => _customInfoCard(
            title: card['title'],
            description: card['description'],
            cardColor: AppColors.lightPink,
            borderColor: AppColors.themeColor,
          ),
        ),
      ],
    );
  }

  // ── Core Beliefs ────────────────────────────────────────────────────────────

  Widget _buildCoreBeliefsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CommonText(
            text: AppTexts.ourCoreBeliefs,
            fontSize: AppFontSizes.fontLarge,
            fontWeight: AppFontWeights.semiBold,
            color: AppColors.blackColor,
          ),
        ),
        Center(
          child: Divider(
            height: 1.3.h,
            thickness: 2.3,
            endIndent: 160,
            indent: 160,
            color: AppColors.dividerBlueColor,
          ),
        ),
        const SizedBox(height: 20),
        ...controller.coreBeliefsCards.map(
              (card) => _customInfoCard(
            title: card['title'],
            description: card['description'],
            cardColor: AppColors.lightPeachColor,
            borderColor: AppColors.softPeachBrown,
          ),
        ),
      ],
    );
  }

  // ── Services ─────────────────────────────────────────────────────────────────

  Widget _buildServicesSection() {
    return Column(
      children: [
        Text(
          AppTexts.servicesWeOffer,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        Center(
          child: Divider(
            height: 1.3.h,
            thickness: 2.3,
            endIndent: 160,
            indent: 160,
            color: AppColors.dividerBlueColor,
          ),
        ),
        const SizedBox(height: 55),
        ...controller.servicesData.map(
              (service) => _serviceCard(
            service['title']!,
            service['imgUrl']!,
            service['description']!,
          ),
        ),
      ],
    );
  }

  // ── Milestones ───────────────────────────────────────────────────────────────

  Widget _buildMilestonesSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: controller.milestoneData
                .take(2)
                .map((e) => _milestoneItem(e))
                .toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: controller.milestoneData
                .skip(2)
                .take(2)
                .map((e) => _milestoneItem(e))
                .toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _milestoneItem(controller.milestoneData[4]),
            ],
          ),
        ],
      ),
    );
  }

  // ── What's New ───────────────────────────────────────────────────────────────

  Widget _buildWhatsNewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppTexts.whatsNew,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        Center(
          child: Divider(
            height: 1.3.h,
            thickness: 2.3,
            endIndent: 160,
            indent: 160,
            color: AppColors.dividerBlueColor,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 400.h,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
  }

  // ── Life at Yes Madam ────────────────────────────────────────────────────────

  Widget _buildLifeAtYesMadam() {
    return Column(
      children: [
        Text(
          AppTexts.lifeAtYesMadam,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pinkAccent),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              AppTexts.weDoYaysome,
              style: const TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Team ─────────────────────────────────────────────────────────────────────

  Widget _buildTeamSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              AppTexts.ourFoundingTeam,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 8),
            Text(
              AppTexts.adityaArya,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              AppTexts.cofounderCoo,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              AppTexts.adityaAryaBio,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  // ── Shark Tank Banner ────────────────────────────────────────────────────────

  Widget _buildSharkTankBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber),
      ),
      child: Column(
        children: [
          Text(
            AppTexts.sharkTankFeatured,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 8),
          Text(
            AppTexts.sharkTankFunding,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // ── Cities ───────────────────────────────────────────────────────────────────

  Widget _buildCitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.weLiveIn50Cities,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: controller.cities
              .map(
                (city) => Chip(
              label: Text(city, style: const TextStyle(fontSize: 12)),
            ),
          )
              .toList(),
        ),
      ],
    );
  }

  // ── Footer ───────────────────────────────────────────────────────────────────

  Widget _buildFooterSection() {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 8),
        Text(
          AppTexts.quickLinks,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          AppTexts.quickLinksText,
          style: const TextStyle(color: Colors.blue, fontSize: 13),
        ),
        const SizedBox(height: 16),
        Text(AppTexts.facingIssues, style: const TextStyle(fontSize: 12)),
        Text(
          AppTexts.supportEmail,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        const SizedBox(height: 16),
        Text(
          AppTexts.copyright,
          style: const TextStyle(color: Colors.grey, fontSize: 11),
        ),
      ],
    );
  }

  // ── Reusable Widgets ─────────────────────────────────────────────────────────

  Widget _customInfoCard({
    String? title,
    String? description,
    Color? cardColor,
    Color? borderColor,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColor ?? AppColors.greyColor, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description ?? '',
              style: const TextStyle(color: Colors.black87, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _serviceCard(String title, String imgUrl, String desc) {
    return Column(
      children: [
        Image.network(imgUrl, width: double.infinity, fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: AppFontWeights.semiBold,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 12.sp,
                  fontWeight: AppFontWeights.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _milestoneItem(Map<String, dynamic> data) {
    return SizedBox(
      width: 110,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.pink.withOpacity(0.12),
                  Colors.pink.withOpacity(0.01),
                ],
              ),
            ),
            child: Center(
              child: Icon(data['icon'], size: 28, color: Colors.black87),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            data['value'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            data['label'],
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: Colors.grey[600], height: 1.2),
          ),
        ],
      ),
    );
  }
}