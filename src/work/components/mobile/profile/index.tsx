import React, { useEffect } from "react";
import Placeholder from "../common/placeholder";
import Header from "./header";
import Sections from "./sections";
import { useProfileLock } from "./states";

const MobileProfile: React.FunctionComponent = () => {
  const [lock] = useProfileLock();

  useEffect(() => {
    if (window.flutter_inappwebview && lock) window.flutter_inappwebview.callHandler("showACDialog");
  }, [lock]);

  return lock ? (
    <Placeholder />
  ) : (
    <div>
      <Header />
      <Sections />
    </div>
  );
};

export default MobileProfile;
