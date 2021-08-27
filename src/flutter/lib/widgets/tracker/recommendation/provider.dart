import 'package:flutter/material.dart';
import 'package:rime_app/graphql/queries/tracker/tracker.data.gql.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart';

class TrackRecommendationProvider extends ChangeNotifier {
  List<GEntityInput> inputList = [];

  void updateSeletedEntities(List<GEntityInput> entities) {
    this.inputList = [];
    entities.forEach((element) {
      inputList.add(element);
    });
    notifyListeners();
  }

  void clearSeletedEntities() {
    this.inputList = [];
    notifyListeners();
  }

  void addSeletedEntity(
    GTrackerRecommendationsData_appTrackerRecommendations entity,
  ) {
    GEntityInputBuilder inputBuilder = GEntityInputBuilder();
    inputBuilder.entityId = entity.entityID;
    inputBuilder.entityType = entity.entityType;
    GEntityInput input = inputBuilder.build();

    int entityIndex =
        this.inputList.lastIndexWhere((e) => e.entityId == input.entityId);
    if (entityIndex != -1) {
      return;
    }
    List<GEntityInput> list = [];
    list.addAll(inputList);
    list.add(input);
    this.inputList = list;
    notifyListeners();
  }

  void deleteSeletedEntity(
    GTrackerRecommendationsData_appTrackerRecommendations entity,
  ) {
    GEntityInputBuilder inputBuilder = GEntityInputBuilder();
    inputBuilder.entityId = entity.entityID;
    inputBuilder.entityType = entity.entityType;
    GEntityInput input = inputBuilder.build();

    List<GEntityInput> list = [];
    list.addAll(inputList);
    list.removeWhere((e) => e.entityId == input.entityId);
    this.inputList = list;
    notifyListeners();
  }
}
