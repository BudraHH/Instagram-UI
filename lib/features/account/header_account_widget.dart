import 'package:flutter/material.dart';

import 'big_avatar_user_widget.dart';
import 'menu_item_widget.dart';

class HeaderAccountWidget extends StatefulWidget {
  static const ROUTE_NAME = 'HeaderAccountWidget';
  @override
  _HeaderAccountWidgetState createState() => _HeaderAccountWidgetState();
}

class _HeaderAccountWidgetState extends State<HeaderAccountWidget> {
  static const TAG = 'HeaderAccountWidget';
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    BigAvatarUserWidget(),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Đặng Ngọc Đức',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: MenuItemWidget(
                        title: '146',
                        content: 'Post',
                      )),
                      Expanded(
                          child: MenuItemWidget(
                        title: '130',
                        content: 'Followers',
                      )),
                      Expanded(
                          child: MenuItemWidget(
                        title: '146',
                        content: 'Following',
                      ))
                    ],
                  ),
                ))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              'Mastering B&W: The Art of B&W \nEditor: @dangngocduc Mod: @dangngocduc @dangngocduc \nFounder: @dangngocduc',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                // primary: Colors.transparent, // Set button background color to transparent
                side: BorderSide(
                    color: Colors.grey), // Add border to simulate outline
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(4.0), // Set button border radius
                ),
              ),
              onPressed: () {},
              child: Text(
                'Edit Profile',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
