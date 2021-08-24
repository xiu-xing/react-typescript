import { TabContext } from "@material-ui/lab";
import React, { useState } from "react";
import { Tab as TabModel } from "../../../generated/graphql";
import { useProfileData, useProfileEntity, useTabIndex } from "../atoms";
import TabPanel from "./tab-panel";
import Tabs from "./tabs";
import { EventProperty, useClient } from "@momentum-valley/muse-js";

const Content: React.FC = () => {
  const [profileData] = useProfileData();
  const [tabIndex] = useTabIndex();
  const muse = useClient();
  const [profileEntity] = useProfileEntity();
  const [active, setActive] = useState<string>(tabIndex);

  const handleTabChange = (newValue: string): void => setActive(newValue);

  muse.sendTrackingEvent("profile.view", {
    entity: EventProperty.entity({
      id: profileEntity.id,
      type: profileEntity.type,
    }),
  });

  return (
    <TabContext value={active}>
      {profileData?.tabs && (
        <Tabs
          tabs={profileData.tabs.filter((s) => typeof s?.id === "string") as TabModel[]}
          onChange={handleTabChange}
        />
      )}
      {profileData?.tabs
        .filter((s) => typeof s?.id === "string")
        .map((t) => (
          <TabPanel key={t?.id} tab={t as TabModel} />
        ))}
    </TabContext>
  );
};

export default Content;
