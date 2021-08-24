import React, { useState } from "react"
import { createContainer } from "unstated-next";


function userAvatar() {
    const [fileErrorStatus, setFileErrorStatus] = useState(false);
    const [file, setFile] = useState<File | null>();
    const [imgSrc, setImgSrc] = useState<string | ArrayBuffer | null>();
    const [iconError, setIconError] = useState(false);
    const [avatarActive, setAvatarActive] = useState(false);
    const [radioValue,setRadioValue] = useState<string|null>();
    const [fileURL, setFileURL] = useState<string | null>();
    const [company, setCompany] = useState<string | null | undefined>('');
  
    return {
        fileErrorStatus, setFileErrorStatus,
        file, setFile,
        imgSrc, setImgSrc,
        iconError, setIconError,
        avatarActive, setAvatarActive,
        fileURL, setFileURL,
        radioValue,setRadioValue,
        company, setCompany,
    }
}

const UserAvatarContainer = createContainer(userAvatar);
export default UserAvatarContainer;
