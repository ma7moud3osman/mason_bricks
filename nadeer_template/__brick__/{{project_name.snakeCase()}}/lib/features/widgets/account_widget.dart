import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/app_enums.dart';

class AccountWidget extends StatelessWidget {
  final AccountItem accountItem;

  const AccountWidget({Key? key, required this.accountItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(accountItem.title).tr(),
          leading: accountItem.icon ??
              (accountItem.image == null
                  ? null
                  : SvgPicture.asset(
                      accountItem.image!,
                      color: Colors.black54,
                      width: 24,
                    )),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
          ),
          onTap: () => accountItem.onTap.call(),
        ),
        const Divider(),
      ],
    );
  }
}

class AccountItem {
  final String title;
  final String? image;
  final Widget? icon;
  final List<Roles> roleList;
  final void Function() onTap;

  const AccountItem({
    required this.roleList,
    required this.title,
    this.image,
    this.icon,
    required this.onTap,
  });
}
