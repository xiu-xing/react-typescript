import { useClient } from "@momentum-valley/muse-js";
import { useEffect, useState } from "react";
import { createContainer } from "unstated-next";
import { EntityType } from "../../generated/graphql";
import { NewsType } from "../../models/news/news";

export interface NewsEntityProps {
  id: string;
  primaryName: string;
  entityType: EntityType;
}

export interface GroupProps {
  id: string;
  name: string;
}

interface NewsStateProps {
  group?: GroupProps;
  entities?: NewsEntityProps[];
  newsType: NewsType;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useNews(initialState?: NewsStateProps) {
  const [keywords, setKeywords] = useState<string[]>([]);
  const [tags, setTags] = useState<string[]>([]);
  const [entities, setEntities] = useState<NewsEntityProps[]>(initialState?.entities ?? []);
  const [group, setGroup] = useState<GroupProps>(initialState?.group || { id: "", name: "" });
  const [showCollectionSearch, setShowCollectionSearch] = useState(false);
  const [entityType, setEntityType] = useState<EntityType | undefined>();
  const [newsType, setNewsType] = useState<NewsType>((initialState && initialState?.newsType) ?? NewsType.All);
  const [tabID, setTabID] = useState<string | undefined>();
  const [fetchingPage, setFetchingPage] = useState(true);
  const muse = useClient();

  useEffect(() => {
    setFetchingPage(true);
    setTimeout(() => {
      setFetchingPage(false);
    }, 600);
  }, [newsType]);

  useEffect(() => {
    if (keywords.length > 0) {
      muse.sendTrackingEvent("news.search", {
        keywords: keywords,
      });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [keywords]);

  return {
    keywords,
    setKeywords,
    entities,
    setEntities,
    showCollectionSearch,
    setShowCollectionSearch,
    group,
    setGroup,
    entityType,
    setEntityType,
    newsType,
    setNewsType,
    tabID,
    setTabID,
    fetchingPage,
    setFetchingPage,
    tags,
    setTags,
  };
}

const NewsContainer = createContainer(useNews);
export default NewsContainer;
