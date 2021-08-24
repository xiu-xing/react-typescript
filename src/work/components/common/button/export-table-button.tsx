import { IconButton } from "@material-ui/core";
import GetAppIcon from "@material-ui/icons/GetApp";
import React from "react";
import UserContainer from "../../../containers/userContainer";
import { Role } from "../../../generated/graphql";

// interface ExportTableButtonProps {
//   onClick?: () => void;
// }

// const ExportTableButton: React.FunctionComponent<ExportTableButtonProps> = (props) => {
//   const {
//     setTrailServiceDialogOpen,
//     setActiveServiceDialogOpen,
//     user,
//     setInstitutionAuthenticationDialog,
//   } = UserContainer.useContainer();

//   return (
//     <IconButton
//       size="small"
//       onClick={(): void => {
//         if (user?.role == Role.Public) {
//           setInstitutionAuthenticationDialog(true);
//           return;
//         }
//         if (user?.role == Role.Basic) {
//           setTrailServiceDialogOpen(true);
//           return;
//         }
//         if (user?.role == Role.Trial || user?.role == Role.Expired) {
//           setActiveServiceDialogOpen(true);
//           return;
//         }
//         props.onClick?.();
//       }}
//     >
//       <GetAppIcon />
//     </IconButton>
//   );
// };

// export default ExportTableButton;
