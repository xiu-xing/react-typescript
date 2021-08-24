import React, { ReactNode } from "react";
import AppContainer from "../../../containers/appContainer";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";
import GlobalMessage from "../global-message/global-message";

interface ContainerWrapperProps {
  children?: ReactNode;
  // user: UserInformation;
}

const ContainerWrapper: React.FunctionComponent<ContainerWrapperProps> = (props) => {
  return (
    <AppContainer.Provider>
      {/* <CustomEventContainer.Provider> */}
      {/* <UserProfileContainer.Provider>
        <UserContainer.Provider
          initialState={{
            user: props.user,
          }}
        > */}
      <SnackbarContainer.Provider>
        {/* <AppbarContainer.Provider>
          <DrawerContainer.Provider> */}
        {/* <CollapseContainer.Provider> */}
        {props.children}
        <GlobalMessage />
        {/* </CollapseContainer.Provider> */}
        {/* </DrawerContainer.Provider>
        </AppbarContainer.Provider> */}
      </SnackbarContainer.Provider>
      {/* </UserContainer.Provider>
      </UserProfileContainer.Provider> */}
      {/* </CustomEventContainer.Provider> */}
    </AppContainer.Provider>
  );
};

export default ContainerWrapper;
