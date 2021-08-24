import { Avatar, makeStyles } from "@material-ui/core";
import React, { useState } from "react";
import UserContainer from "../../../../../../../../../userContainer";
import UserAvatarContainer from "../../../../../user-avatar-container";

const useStyle = makeStyles({
    avatar: {
        width: "56px",
        height: "56px",
        background: "none",
    },
    avatarImg: {
        maxWidth: "56px",
        maxHeight: "56px",
    },
    //  TODO try to set child node
    avatarMaskLayer: {
        display: "block",
        position: "absolute",
        left: "0px",
        top: "0px",
        borderRadius: "6px",
        background: "rgba(216,216,216,.5)",
        color: "rgba(102,102,102,1)",
        fontSize: "14px",
        lineLeight: "20px",
        fontWeight: 500,
        padding: "14px",
        textAlign: "center",
        transition: "opacity .3s",
    },
    inputFile: {
        width: "100%",
        height: "100%",
        border: "none",
        outline: "none",
        background: "none",
        opacity: 0,
        zIndex: 1,
        position: "absolute",
        top: 0,
        left: 0,
    },
    icon: {
        color: "#66778B",
        fontSize: "56px",
    },
});

function AvatarUpload() {
    const classes = useStyle();
    const [imgSrc, setImgSrc] = useState<string | ArrayBuffer | null>();
    const [iconError, setIconError] = useState(false);
    const [avatarActive, setAvatarActive] = useState(false);
    const { setFile } = UserAvatarContainer.useContainer();
    const { user } = UserContainer.useContainer();

    function onFileChange(event: React.ChangeEvent<HTMLInputElement>): void {
        const files = event.target.files;
        if (files) {
            const file = files[files.length - 1];
            setFile(file);
            const fr = new FileReader();
            fr.onload = (): void => {
                setImgSrc(fr.result);
            };
            fr.readAsDataURL(file);
        }
    }

    return (
        <>
            <Avatar
                className={classes.avatar}
                alt=""
                onMouseEnter={() => setAvatarActive(true)}
                onMouseLeave={() => setAvatarActive(false)}
            >
               <img className={classes.avatarImg} src={imgSrc as string} />
                {/* {imgSrc ? (
                    <img className={classes.avatarImg} src={imgSrc as string} />
                ) : user?.avatar && !iconError ? (
                    <img
                        className={classes.avatarImg}
                        onError={() => {
                            setIconError(true);
                        }}
                        src={user?.avatar as string}
                    />
                ) : (
                    <AccountCircleOutline className={classes.icon} />
                )} */}
                {avatarActive ? <span className={classes.avatarMaskLayer}>上传头像</span> : ""}
                <input id="file" type="file" accept="image/*" onChange={onFileChange} className={classes.inputFile} />
            </Avatar>
        </>
    );
}

export default AvatarUpload;
