import 'package:be_calm/features/user/data/protfile_list_Item.dart';
import 'package:be_calm/features/user/presentation/screens/profile_list_title.dart';
import 'package:flutter/widgets.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: profileListData.map((item) {
        return ProfileListTile(
          icon: item.icon,
          title: item.title,
        );
      }).toList(),
    );
  }
}