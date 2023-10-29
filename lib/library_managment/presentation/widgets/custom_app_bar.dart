import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../themes/app_assets.dart';
import '../themes/app_colors.dart';
import '../themes/app_constants.dart';

PreferredSize getAppBar(BuildContext context, Function logout,
    {Widget? child, double? height}) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, height ?? 70),
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 2, right: 2),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.offWhite1,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0.0, 1.0), //(x,y)
                blurRadius: 4.0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            child ??
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                AppAssets.retBooks,
                                width: 24,
                                height: 20,
                                fit: BoxFit.fill,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(AppConstants.appName),
                              ),
                              // const Spacer(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () => logout(),
                                icon: const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Text("Logout"),
                                    ),
                                    Icon(FeatherIcons.logOut),
                                  ],
                                )))
                      ],
                    )
                  ],
                ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ),
  );
}
