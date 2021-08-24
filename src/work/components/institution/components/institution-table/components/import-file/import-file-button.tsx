import { Button, List, ListItem, Popover } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { FileUploadOutline } from "mdi-material-ui";
import React, { useState } from "react";
import InstitutionContainer, { fileImportedTypes, InstitutionType } from "../../../../institutionContainer";
import ImportFileDialog from "./import-file-upload-dialog";
import ImportFileFailDialog from "./import-file-fail-dialog";
import ImportFileSuccessDialog from "./import-file-success-dialog";
import InstitutionTableContainer from "../../institutionTableContainer";
import UserContainer from "../../../../../../containers/userContainer";
import { Role } from "../../../../../../generated/graphql";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      fontSize: 14,
      marginLeft: 10,
    },
    icon: {
      color: "#333",
      marginRight: 4,
    },
  }),
);

const ImportFileButton: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const [anchorEl, setAnchorEl] = React.useState<HTMLButtonElement | null>(null);
  const [groupCode, setGroupCode] = useState<InstitutionType>();
  const { failDialogOpen, setFailDialogOpen, fileUpload } = InstitutionContainer.useContainer();
  const { setActiveServiceDialogOpen, user, setTrailServiceDialogOpen } = UserContainer.useContainer();
  const { isProRole } = InstitutionContainer.useContainer();
  const [successDialogOpen, setSuccessDialogOpen] = useState(false);
  const [dialogOpen, setDialogOpen] = useState(false);

  function onButtonClick(event: React.MouseEvent<HTMLButtonElement>): void {
    setAnchorEl(event.currentTarget);
  }

  function popoverCloseHandler(): void {
    setAnchorEl(null);
  }

  return (
    <>
      <Button className={classes.root} onClick={onButtonClick}>
        <FileUploadOutline className={classes.icon} />
        文件导入
      </Button>
      <Popover
        onClose={popoverCloseHandler}
        anchorEl={anchorEl}
        open={Boolean(anchorEl)}
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "left",
        }}
      >
        <List>
          {fileImportedTypes.map((item, index) => {
            return (
              <ListItem
                key={index}
                button
                onClick={(): void => {
                  if (!isProRole) {
                    if (user?.role == Role.Basic) {
                      setTrailServiceDialogOpen(true);
                    } else {
                      setActiveServiceDialogOpen(true);
                    }
                    popoverCloseHandler();
                    return;
                  }
                  setDialogOpen(true);
                  setGroupCode(
                    item.groupCode == InstitutionType.CorporateEntity
                      ? ("fund_manager" as InstitutionType)
                      : item.groupCode,
                  );
                  popoverCloseHandler();
                }}
              >
                {item.name}
              </ListItem>
            );
          })}
        </List>
      </Popover>

      <ImportFileDialog
        open={dialogOpen}
        close={(): void => {
          setDialogOpen(false);
        }}
        dialogTitle={"文件导入"}
        groupCode={groupCode as InstitutionType}
        onSuccess={(): void => {
          setSuccessDialogOpen(true);
        }}
      />
      <ImportFileFailDialog
        open={failDialogOpen}
        close={(): void => {
          setFailDialogOpen(false);
        }}
        dialogTitle={"文件导入"}
        groupCode={groupCode as InstitutionType}
        fileUpload={fileUpload}
      />
      <ImportFileSuccessDialog
        open={successDialogOpen}
        close={(): void => {
          setSuccessDialogOpen(false);
        }}
        dialogTitle={"文件导入"}
      />
    </>
  );
};

export default ImportFileButton;
