import 'package:rime_app/graphql/queries/quick_search/quick_search.data.gql.dart';
import 'package:rime_app/graphql/types/entity/entity_fragment.data.gql.dart';
import 'package:rime_app/graphql/types/quick_search/quick_search_fragment.data.gql.dart';
import 'package:rime_app/models/action/action.dart';

enum QuickSearchNodeType { ENTITY, INFOFLOW }

class Node {
  String? description;
  String? logoURI;
  String? nodeId;
  String? searchType;
  List<String>? highlightTexts;
  String? subtitle;
  String? title;
  List<GQuickSearchEntityNodeFields_tags>? entityTags;
  List<GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode_tags>?
      infoFlowTags;
  ActionModel? action;
  String? publishTime;
  QuickSearchNodeType? type;
  List<GEntityFields>? relatedEntity;

  static build(GQuickSearchEntityNodeFields entityNode) {
    Node node = Node();
    node.description = entityNode.description;
    node.logoURI = entityNode.logoURI;
    node.nodeId = entityNode.nodeId;
    node.searchType = entityNode.searchType;
    node.subtitle = entityNode.subtitle;
    node.title = entityNode.title;
    node.type = QuickSearchNodeType.ENTITY;

    if (entityNode.highlightTexts == null ||
        entityNode.highlightTexts!.isEmpty) {
      node.highlightTexts = [];
    } else {
      node.highlightTexts = entityNode.highlightTexts!.map((e) => e).toList();
    }

    if (entityNode.tags == null || entityNode.tags!.isEmpty) {
      node.entityTags = [];
    } else {
      node.entityTags = entityNode.tags?.toList();
    }

    ActionModel action = new ActionModel(
        entityNode.action?.type.toString() ?? "", entityNode.action?.args);
    node.action = action;
    return node;
  }

  static buildByFlowNode(
      GQuickSearchData_quickSearch_nodes__asQuickSearchInfoFlowNode
          entityNode) {
    Node node = Node();
    node.description = entityNode.description;
    node.logoURI = entityNode.imageURI;
    node.nodeId = entityNode.nodeId;
    node.searchType = entityNode.searchType;
    node.subtitle = entityNode.subtitle;
    node.title = entityNode.title;
    node.type = QuickSearchNodeType.INFOFLOW;
    node.infoFlowTags = entityNode.tags?.toList();

    if (entityNode.publishTime != null)
      node.publishTime = entityNode.publishTime.toString() + "000";

    if (entityNode.highlightTexts == null ||
        entityNode.highlightTexts!.isEmpty) {
      node.highlightTexts = [];
    } else {
      node.highlightTexts = entityNode.highlightTexts!.map((e) => e).toList();
    }

    // if (entityNode.relatedEntity == null || entityNode.relatedEntity!.isEmpty) {
    //   node.relatedEntity = [];
    // } else {
    //   node.relatedEntity = entityNode.relatedEntity?.toList();
    // }

    ActionModel action = new ActionModel(
        entityNode.action?.type.toString() ?? "", entityNode.action?.args);
    node.action = action;
    return node;
  }
}
