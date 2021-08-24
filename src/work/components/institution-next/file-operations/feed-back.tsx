import { TextField } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useEffect, useState } from "react";
import { REGEX } from "../../../utils/regex";
import ContactInformation from "../../common/contact-information";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "24px 32px",
      maxWidth: 400,
    },
    text: {
      color: theme.palette.grey[500],
      fontSize: 14,
    },
    red: {
      color: "#E00000",
    },
    input: {
      marginBottom: theme.spacing(3),
      width: "100%",
      "& .Mui-focused": {
        color: "#999",
      },
    },
  }),
);

interface FeedBackProps {
  onPhoneChange: (phone: string | undefined) => void;
  onErrorChange: (error: boolean) => void;
}

const FeedBack: React.FunctionComponent<FeedBackProps> = ({ onPhoneChange, onErrorChange }) => {
  const classes = useStyles();
  const [error, setError] = useState(false);
  const [phone, setPhone] = useState<string>("");

  useEffect(() => {
    if (phone) {
      const error = !REGEX.phone.test(phone);
      setError(error);
      onErrorChange(error);
      if (error) return onPhoneChange(undefined);
      return onPhoneChange(phone);
    }
    onErrorChange(true);
  }, [phone]);

  return (
    <div className={classes.root}>
      <TextField
        label="联系方式"
        className={classes.input}
        value={phone}
        onChange={(e) => setPhone(e.target.value.replace(/[^\d]/g, ""))}
        error={error}
      />
      <ContactInformation />
    </div>
  );
};

export default FeedBack;
