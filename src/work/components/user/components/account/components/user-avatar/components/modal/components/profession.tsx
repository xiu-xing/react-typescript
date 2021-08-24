import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useState, useEffect } from "react";
import { FormControl, FormLabel, TextField, MenuItem } from "@material-ui/core";
import clsx from "clsx";
import UserContainer from "../../../../../../../userContainer";
import UserAvatarContainer from "../../../user-avatar-container";

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
    selectOption: {
        fontSize: 16,
    },
});

const Professions = [
    {
        name: "创业者",
        value: "entrepreneur",
    },
    {
        name: "投资人",
        value: "investor",
    },
    {
        name: "FA",
        value: "FA",
    },
    {
        name: "高管",
        value: "executive",
    },
    {
        name: "职员",
        value: "official",
    },
    {
        name: "媒体从业者",
        value: "mediaPractitioner",
    },
    {
        name: "专家",
        value: "expert",
    },
    {
        name: "区块链从业者",
        value: "blockchainPractitioner",
    },
    {
        name: "学生",
        value: "student",
    },
    {
        name: "其他",
        value: "others",
    },
];
interface ProfessionProps {
    identity?: string | null;
}

const Profession: React.FunctionComponent<ProfessionProps> = props => {
    const classes = useStyles();
    const { setRadioValue } = UserAvatarContainer.useContainer();
    const [radio, setRadio] = useState(Professions[0].value);

    useEffect(() => {
        setRadio(props.identity as string)
    }, [props.identity])

    useEffect(() => {
        setRadioValue(radio)
    }, [radio])

    return (
        <FormControl className={classes.formControl} component="fieldset">
            <FormLabel className={classes.inputTitle} focused={false} component="legend">
                您是...
        </FormLabel>
            <TextField
                name="profession"
                select
                value={radio}
                inputProps={{
                    name: "profession",
                    id: "professions",
                }}
            >
                {Professions.map((option, index) => {
                    return (
                        <MenuItem
                            key={index}
                            value={option.value}
                            selected={props.identity === option.value}
                            onClick={() => {
                                setRadio(option.value);
                            }}
                            className={clsx(classes.selectOption)}
                        >
                            {option.name}
                        </MenuItem>
                    );
                })}
            </TextField>
        </FormControl>
    );
}

export default Profession;