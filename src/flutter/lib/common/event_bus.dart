import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:event_bus/event_bus.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';

class EventBusUtil {
  static EventBus? _eventBus;

  static EventBus getInstance() {
    if (_eventBus == null) {
      _eventBus = EventBus();
    }
    return _eventBus!;
  }

  static StreamSubscription<T> listen<T extends Event>(
      Function(T event) onData) {
    if (_eventBus == null) {
      _eventBus = EventBus();
    }
    return _eventBus!.on<T>().listen(onData);
  }

  static void fire<T extends Event>(T e) {
    if (_eventBus == null) {
      _eventBus = EventBus();
    }
    _eventBus!.fire(e);
  }
}

class Event {}

class SwitchSkeletonNavigationBarEvent extends Event {
  String pageName;
  String tabId;
  SwitchSkeletonNavigationBarEvent(this.pageName, this.tabId);
}

class UserRoleChangeEvent extends Event {
  GRole userRole;
  UserRoleChangeEvent(this.userRole);
}

class TrackedEntityEvent extends Event {
  GTrackerTheme trackerTheme;
  TrackedEntityEvent(this.trackerTheme);
}

class ConnectivityChangeEvent extends Event {
  ConnectivityResult result;
  ConnectivityChangeEvent(this.result);
}

class TrackedEntityStatusEvent extends Event {
  String id;
  bool isTracked;
  TrackedEntityStatusEvent(this.id, this.isTracked);
}

class UserFinishPaymentEvent extends Event {
  String commodityID;
  UserFinishPaymentEvent(this.commodityID);
}
