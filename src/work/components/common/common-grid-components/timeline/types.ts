import _ from "lodash";

export enum TrackerTimelineType {
  Other = "other",
  News = "news",
}

export enum FilterProtoType {
  SelectFilter = "select_filter",
}
export class Option {
  key = "";
  value = "";

  static fromJSON(json: unknown): Option {
    const option = new Option();

    const key = _.get(json, "key");
    key && (option.key = key);

    const value = _.get(json, "value");
    value && (option.value = value);

    return option;
  }
}

export class Content {
  id = "";
  icon: { value: string } = { value: "" };

  options: Option[] = [];

  name: { value: string } = { value: "" };

  multiple: { value: boolean } = { value: false };

  static fromJSON(json: unknown): Content {
    const content = new Content();

    const id = _.get(json, "id");
    id && (content.id = id);

    const icon = _.get(json, "icon");
    icon && (content.icon = icon);

    const name = _.get(json, "name");
    name && (content.name = name.value);

    const multiple = _.get(json, "multiple");
    multiple && (content.multiple = multiple);

    const options = _.get(json, "options");
    if (options) {
      const optionsList: Option[] = [];
      let item: Option = new Option();
      options.forEach((option: Option) => {
        item = Option.fromJSON(option);
        optionsList.push(item);
      });
      content.options = options;
    }

    return content;
  }
}

export class FilterProto {
  type: FilterProtoType = FilterProtoType.SelectFilter;

  content: Content = new Content();

  static fromJSON(json: unknown): FilterProto {
    const filterProto = new FilterProto();

    const type = _.get(json, "type");
    type && (filterProto.type = type);

    const content = Content.fromJSON(_.get(json, "content"));
    content && (filterProto.content = content);

    return filterProto;
  }
}

export class TrackerTimelineConfig {
  id = "";

  type: TrackerTimelineType = TrackerTimelineType.Other;

  filterProtos: FilterProto[] = [];

  static fromJSON(json: unknown): TrackerTimelineConfig {
    const trackerTimelineConfig = new TrackerTimelineConfig();

    const id = _.get(json, "id");
    id && (trackerTimelineConfig.id = id);

    const type = _.get(json, "type");
    type && (trackerTimelineConfig.type = type);

    const filterProtos = _.get(json, "filter_protos");
    if (filterProtos) {
      const filterProtosList: FilterProto[] = [];
      let item: FilterProto = new FilterProto();
      filterProtos.forEach((filterProp: FilterProto) => {
        item = FilterProto.fromJSON(filterProp);
        filterProtosList.push(item);
      });
      trackerTimelineConfig.filterProtos = filterProtosList;
    }

    return trackerTimelineConfig;
  }
}
