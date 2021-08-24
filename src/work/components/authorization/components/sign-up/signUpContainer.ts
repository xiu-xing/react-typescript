import { useState } from "react";
import { createContainer } from "unstated-next";

type SignUpStep = "verification" | "settingPassword";
type PasswordAction = "createAccount" | "activateAccount";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useSignUp() {
  const [account, setAccount] = useState("");
  const [operationToken, setOperationToken] = useState("");
  const [signUpStep, setSignUpStep] = useState<SignUpStep>("verification");
  const [passwordAction, setPasswordAction] = useState<PasswordAction>("createAccount");

  return {
    account,
    setAccount,
    operationToken,
    setOperationToken,
    signUpStep,
    setSignUpStep,
    passwordAction,
    setPasswordAction,
  };
}

const SignUpContainer = createContainer(useSignUp);
export default SignUpContainer;
