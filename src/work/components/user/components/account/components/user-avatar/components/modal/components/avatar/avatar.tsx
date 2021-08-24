import React from "react";
import { FormControl, FormLabel, makeStyles, createStyles, Theme } from "@material-ui/core";
import AvatarUpload from "./components/avatar-upload";
const useStyles = makeStyles({
    formControl: {
        display: "grid",
        gridAutoFlow: "row",
        padding: "10px 0px 0px 0px",
    },
    inputTitle: {
        fontSize: "14px",
        fontWeight: 400,
        color: "rgba(102, 102, 102, 1)",
    },
})


function Avatar() {
    const classes = useStyles();
    return (
        <FormControl className={classes.formControl} component="fieldset">
            <FormLabel className={classes.inputTitle} focused={false} component="legend">
                头像
            </FormLabel>
            <AvatarUpload />
        </FormControl>
    )
}
export default Avatar;