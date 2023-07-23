import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/functions/sized_box_functions.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_font.dart';
import '../../core/widgets/custom_elevated_button.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: CustomElevatedButton(
          buttonSize: Size.fromHeight(50.h),
          buttonLabel: "Accept",
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primary,
          borderColor: AppColors.border,
          fontSize: 16.sp,
          onPress: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.paddingH),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.hh,
            const Text(
              "He should be particularly happy at any time, etc. etc.; and if she would give him leave, would take an early opportunity of waiting on them.",
            ),
            10.hh,
            const Text(
              "“Can you come to-morrow?”",
            ),
            10.hh,
            const Text(
              "Yes, he had no engagement at all for to-morrow; and her invitation was accepted with alacrity.",
            ),
            10.hh,
            const Text(
              "He came, and in such very good time that the ladies were none of them dressed. In ran Mrs. Bennet to her daughter’s room, in her dressing gown, and with her hair half finished, crying out:",
            ),
            10.hh,
            const Text(
              "“My dear Jane, make haste and hurry down. He is come--Mr. Bingley is come. He is, indeed. Make haste, make haste. Here, Sarah, come to Miss Bennet this moment, and help her on with her gown. Never mind Miss Lizzy’s hair.”",
            ),
            10.hh,
            const Text(
              "“We will be down as soon as we can,” said Jane; “but I dare say Kitty is forwarder than either of us, for she went up stairs half an hour ago.”",
            ),
            10.hh,
            const Text(
              "“Oh! hang Kitty! what has she to do with it? Come be quick, be quick! Where is your sash, my dear?”",
            ),
            10.hh,
            const Text(
              "But when her mother was gone, Jane would not be prevailed on to go down without one of her sisters.",
            ),
            10.hh,
            const Text(
              "The same anxiety to get them by themselves was visible again in the evening. After tea, Mr. Bennet retired to the library, as was his custom, and Mary went up stairs to her instrument. Two obstacles of the five being thus removed, Mrs. Bennet sat looking and winking at Elizabeth and Catherine for a considerable time, without making any impression on them. Elizabeth would not observe her; and when at last Kitty did, she very innocently said, “What is the matter mamma? What do you keep winking at me for? What am I to do?”",
            ),
            10.hh,
            const Text(
              "“Nothing child, nothing. I did not wink at you.” She then sat still five minutes longer; but unable to waste such a precious occasion, she suddenly got up, and saying to Kitty, “Come here, my love, I want to speak to you,” took her out of the room. Jane instantly gave a look at Elizabeth which spoke her distress at such premeditation, and her entreaty that she would not give in to it. In a few minutes, Mrs. Bennet half-opened the door and called out:",
            ),
            10.hh,
            const Text(
              "“Lizzy, my dear, I want to speak with you.”",
            ),
            10.hh,
            const Text(
              "Elizabeth was forced to go.",
            ),
            10.hh,
            const Text(
              "“We may as well leave them by themselves you know;” said her mother, as soon as she was in the hall. “Kitty and I are going up stairs to sit in my dressing-room.”",
            ),
            10.hh,
            const Text(
              "Elizabeth made no attempt to reason with her mother, but remained quietly in the hall, till she and Kitty were out of sight, then returned into the drawing-room.",
            ),
            10.hh,
            const Text(
              "Mrs. Bennet’s schemes for this day were ineffectual. Bingley was every thing that was charming, except the professed lover of her daughter. His ease and cheerfulness rendered him a most agreeable addition to their evening party; and he bore with the ill-judged officiousness of the mother, and heard all her silly remarks with a forbearance and command of countenance particularly grateful to the daughter.",
            ),
          ],
        ),
      ),
    );
  }
}
