import 'dart:io' as io;

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluwx/fluwx.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';
import 'package:rime_app/common/env.dart';
import 'package:rime_app/common/event_bus.dart';
import 'package:rime_app/common/global.dart';
import 'package:rime_app/common/muse_event.dart';
import 'package:rime_app/common/user_provider.dart';
import 'package:rime_app/graphql/client.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.data.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.req.gql.dart';
import 'package:rime_app/graphql/queries/authorization/authorization.var.gql.dart';
import 'package:rime_app/graphql/queries/team/team.data.gql.dart';
import 'package:rime_app/models/route/routes.dart';
import 'package:rime_app/theme.dart';
import 'package:rime_app/utils/storage.dart';
import 'package:rime_app/widgets/account/widgets/institutional-edition.dart';
import 'package:rime_app/widgets/account/widgets/menu-item.dart';
import 'package:rime_app/widgets/account/widgets/user-info.dart';
import 'package:rime_app/widgets/common/custom_icons/custom_icons.dart';
import 'package:rime_app/widgets/common/network_image.dart';

import '../../router.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with AutomaticKeepAliveClientMixin {
  String? serviceEndTime;

  @override
  void initState() {
    super.initState();
    EventBusUtil.listen<UserFinishPaymentEvent>((e) {
      if (e.commodityID.isNotEmpty) _getUserPremiumSubscriptionBalance();
    });
    _getUserPremiumSubscriptionBalance();
  }

  void _getUserPremiumSubscriptionBalance() {
    GQL.executeQuery<GUserPremiumSubscriptionBalanceData,
            GUserPremiumSubscriptionBalanceVars>(
        GUserPremiumSubscriptionBalanceReq(), onData: (s, r) {
      s.cancel();
      if (r.data?.UserPremiumSubscriptionBalance == null) return;
      setState(() => serviceEndTime = "到期时间 " +
          DateTime.fromMillisecondsSinceEpoch(
                  (r.data!.UserPremiumSubscriptionBalance.serviceEndTime) *
                      1000)
              .toString()
              .substring(0, 10));
    });
  }

  Future<void> _shareApp(WeChatScene scene) async {
    bool success = await shareToWeChat(
      WeChatShareWebPageModel(
        APP_DOWNLOAD_LINK,
        title: "RimeData 来觅数据",
        description: "全面的一级市场投融数据平台",
        thumbnail: WeChatImage.asset('assets/images/rime-logo.jpg'),
        scene: scene,
        compressThumbnail: true,
      ),
    );

    if (success) {
      Navigator.of(context).pop();
    }
  }

  void _copyDownloadLink() {
    Clipboard.setData(ClipboardData(text: APP_DOWNLOAD_LINK)).then((value) {
      Navigator.of(context).pop();
      showToast('复制成功');
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Consumer<UserProvider>(
                builder: (context, provider, _) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      UserInfo(
                        name: provider.user?.userName,
                        avatarURI: provider.user?.avatarURL,
                        serviceEndTime: serviceEndTime,
                      ),
                      Selector<UserProvider, GTeamsData_teams?>(
                        selector: (c, p) => p.defaultTeam,
                        builder: (context, team, _) {
                          if (team == null) return InstitutionalEditionButton();
                          return Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.w),
                                child: NetWorkImage(
                                  image: team.portraitUri ?? "",
                                  size: 24.w,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  right: 16.w,
                                  top: 16.h,
                                  bottom: 16.w,
                                ),
                                child: Text(
                                  team.name,
                                  style: subtitle1.copyWith(height: 1.2),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      MenuItem(
                        title: "我的追踪",
                        icon: CustomIcons.track,
                        onPress: () {
                          MuseEventUtil.sendEvent(
                            eventId: MuseEventUtil.AccountItemClickId,
                            value: {
                              "item_name": {"value": "我的追踪"}
                            },
                          );
                          router.navigateTo(context, Routes.trakerEntities);
                        },
                      ),
                      MenuItem(
                        title: "订单管理",
                        icon: CustomIcons.bill,
                        onPress: () {
                          MuseEventUtil.sendEvent(
                            eventId: MuseEventUtil.AccountItemClickId,
                            value: {
                              "item_name": {"value": "订单管理"}
                            },
                          );
                          router.navigateTo(context, Routes.marketManagement);
                        },
                      ),
                      MenuItem(
                        title: "联系我们",
                        icon: CustomIcons.headset,
                        onPress: () {
                          router.navigateTo(context, Routes.contact);
                        },
                      ),
                      MenuItem(
                        title: "关于我们",
                        icon: CustomIcons.accountoutline,
                        onPress: () {
                          MuseEventUtil.sendEvent(
                            eventId: MuseEventUtil.AccountItemClickId,
                            value: {
                              "item_name": {"value": "关于我们"}
                            },
                          );
                          router.navigateTo(context, Routes.about);
                        },
                      ),
                      MenuItem(
                        title: "分享 APP",
                        icon: CustomIcons.openinnew,
                        onPress: () async {
                          MuseEventUtil.sendEvent(
                            eventId: MuseEventUtil.AccountItemClickId,
                            value: {
                              "item_name": {"value": "分享 APP"}
                            },
                          );
                          showModalBottomSheet(
                            context: context,
                            builder: (ctx) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Container(
                                              height: 1,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.white,
                                                    Pigment.fromString(
                                                        "#e7e7e7"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Text(
                                            "分享至",
                                            style: bodyText1,
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Flexible(
                                            child: Container(
                                              height: 1,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Pigment.fromString(
                                                        "#e7e7e7"),
                                                    Colors.white,
                                                  ],
                                                  // transform:
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: _copyDownloadLink,
                                            child: Wrap(
                                              direction: Axis.vertical,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              children: [
                                                Icon(
                                                  CustomIcons.link,
                                                  size: 28.sp,
                                                ),
                                                Text(
                                                  "复制链接",
                                                  style: bodyText2.copyWith(
                                                    color: grey66,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () =>
                                                _shareApp(WeChatScene.SESSION),
                                            child: Wrap(
                                              direction: Axis.vertical,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              children: [
                                                Icon(
                                                  CustomIcons.wechat,
                                                  size: 28.sp,
                                                  color: Pigment.fromString(
                                                      "#51B85F"),
                                                ),
                                                Text(
                                                  "微信好友",
                                                  style: bodyText2.copyWith(
                                                    color: grey66,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () =>
                                                _shareApp(WeChatScene.TIMELINE),
                                            child: Wrap(
                                              direction: Axis.vertical,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              children: [
                                                Icon(
                                                  CustomIcons.timeline,
                                                  size: 28.sp,
                                                  color: Pigment.fromString(
                                                      "#51B85F"),
                                                ),
                                                Text(
                                                  "朋友圈",
                                                  style: bodyText2.copyWith(
                                                    color: grey66,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      MenuItem(
                        title: "意见反馈",
                        icon: CustomIcons.messageoutline,
                        onPress: () {
                          MuseEventUtil.sendEvent(
                            eventId: MuseEventUtil.AccountItemClickId,
                            value: {
                              "item_name": {"value": "意见反馈"}
                            },
                          );
                          router.navigateTo(context, Routes.feedBack);
                        },
                      ),
                      MenuItem(
                        title: "退出登录",
                        icon: CustomIcons.logoutvariant,
                        onPress: () {
                          MuseEventUtil.sendEvent(
                            eventId: MuseEventUtil.AccountItemClickId,
                            value: {
                              "item_name": {"value": "退出登录"}
                            },
                          );
                          SecureStorage.deleteValue(key: 'token');
                          String userID =
                              Global.userProvider.user?.userID ?? "";
                          if (userID != "") {
                            String alias = userID.replaceAll('-', '_');

                            if (io.Platform.isIOS) {
                              Global.getuiPushUtil.iOSUnbindAlias(alias);
                            } else {
                              Global.getuiPushUtil.deleteAilas(alias);
                            }
                          }
                          router.navigateTo(
                            context,
                            Routes.signIn,
                            replace: true,
                            transition: TransitionType.cupertino,
                          );
                        },
                      ),
                      // SizedBox(height: 20.h),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
