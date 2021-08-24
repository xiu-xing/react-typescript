import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useState, useEffect } from "react";
import { FormControl, FormLabel, TextField, InputAdornment, Paper, List, MenuItem } from "@material-ui/core";
import { Magnify } from "mdi-material-ui";
import { useForm } from "react-hook-form";
import { useSuggestionsQuery, SuggestType, Suggestion } from "../../../../../../../../../generated/graphql";
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
    searchList: {
        position: "absolute",
        zIndex: 501,
        left: 0,
        top: 60,
        width: "100%",
        maxHeight: 170,
        overflow: "auto",
    },
    textIcon: {
        color: "#66778B",
    },
});

interface CompanyProps {
    company?: string | null;
}

const Company: React.FunctionComponent<CompanyProps> = props => {
    const classes = useStyles();
    const [value, setValue] = useState<string | null | undefined>(props.company);
    const { setCompany } = UserAvatarContainer.useContainer()
    const [actived, setActived] = useState(false);
    const { register, errors, clearError } = useForm({
        reValidateMode: "onBlur",
        mode: "onBlur",
    });
    const [{ data }, executeQuery] = useSuggestionsQuery({
        requestPolicy: "network-only",
        variables: {
            query: value as string,
            first: 10,
            suggestTypes: [SuggestType.SuggestTypeCompany],
        },
        pause: true,
    });

    useEffect((): void => {
        setCompany(value)
        executeQuery()
    }, [value]);

    return (
        <FormControl className={classes.formControl} component="fieldset">
            <FormLabel className={classes.inputTitle} focused={false} component="legend">
                {"任职公司"}
            </FormLabel>
            <TextField
                autoComplete="off"
                name="company"
                inputRef={register({
                    required: { value: true, message: "请输入公司名" },
                })}
                size="medium"
                color="primary"
                placeholder="公司名"
                error={Boolean(errors.company)}
                helperText={errors.company ? errors.company["message"] : ""}
                onChange={(event) => {
                    if (!actived) {
                        setActived(true)
                    }
                    clearError("company")
                    setValue(event.target.value)
                }}
                value={value}
                InputProps={{
                    startAdornment: (
                        <InputAdornment position="start">
                            <Magnify className={classes.textIcon} />
                        </InputAdornment>
                    ),
                }}
            />
            {data && actived && (data?.suggestions?.nodes as Suggestion[]).length > 0 ? (
                <Paper className={classes.searchList}>
                    <List>
                        {data.suggestions.nodes?.map((option, index) => {
                            return (
                                <MenuItem
                                    key={index}
                                    onClick={() => {
                                        setActived(false)
                                        setValue(option?.primaryName)
                                    }}
                                >
                                    {option?.primaryName}
                                </MenuItem>
                            );
                        })}
                    </List>
                </Paper>
            ) : null}
        </FormControl>
    )
}

export default Company;