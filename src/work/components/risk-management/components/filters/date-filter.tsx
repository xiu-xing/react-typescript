import DateFnsUtils from "@date-io/date-fns";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { DatePicker, DatePickerProps, MuiPickersUtilsProvider } from "@material-ui/pickers";
import { MaterialUiPickersDate } from "@material-ui/pickers/typings/date";
import cnLocal from "date-fns/locale/zh-CN";
import React, { useState } from "react";
import UserContainer from "../../../../containers/userContainer";
import { Role } from "../../../../generated/graphql";

const useStyles = makeStyles(() =>
  createStyles({
    inputRoot: {
      height: 30,
      width: "8rem",
      fontSize: 14,
    },
  }),
);

interface DateFilterProps extends Omit<DatePickerProps, "onChange" | "value"> {
  placeholder?: string;
  onDateChange?: (date: string) => void;
}

const DateFilter: React.FunctionComponent<DateFilterProps> = (props) => {
  const classes = useStyles();

  const { placeholder, onDateChange, ...restProps } = props;
  const {
    user,
    setTrailServiceDialogOpen,
    setInstitutionAuthenticationDialog,
    setActiveServiceDialogOpen,
  } = UserContainer.useContainer();
  const [isOpen, setIsOpen] = useState(false);
  const date = new Date();
  const [selectedDate, setSelectedDate] = useState(date.toLocaleDateString());

  return (
    <MuiPickersUtilsProvider utils={DateFnsUtils} locale={cnLocal}>
      <DatePicker
        variant="inline"
        open={isOpen}
        inputVariant="outlined"
        InputProps={{
          classes: {
            root: classes.inputRoot,
          },
        }}
        onOpen={(): void => {
          if (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) {
            setInstitutionAuthenticationDialog(true);
            return;
          }
          if (user?.role == Role.Basic) {
            setTrailServiceDialogOpen(true);
            return;
          }
          if (user?.role == Role.Expired) {
            setActiveServiceDialogOpen(true);
            return;
          }
          setIsOpen(true);
        }}
        onClose={(): void => setIsOpen(false)}
        label={placeholder}
        format="yyyy-MM-dd"
        value={selectedDate}
        onChange={(date: MaterialUiPickersDate): void => {
          if (date) {
            const dateFormat = date?.toLocaleDateString();
            setSelectedDate(dateFormat);
            onDateChange?.(date.getTime().toString());
            setIsOpen(false);
          }
        }}
        {...restProps}
      />
    </MuiPickersUtilsProvider>
  );
};

export default DateFilter;
