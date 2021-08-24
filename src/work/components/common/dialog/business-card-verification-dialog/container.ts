import { useEffect, useState } from "react";
import { createContainer } from "unstated-next";
import UserContainer from "../../../../containers/userContainer";
import { BusinessCardInformation, JoinStatus, Role, useBussinessCardDetailQuery } from "../../../../generated/graphql";

function getSteps(): string[] {
  return ["认证机构", "信息审核", "信息验证"];
}

export interface BusinessCardVerificationDialogIninitialState {
  initialStep: number;
  open: boolean;
  onClose?: VoidFunction;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useBusinessCardVerificationDialog(
  initialState: BusinessCardVerificationDialogIninitialState = {
    initialStep: 0,
    open: false,
  },
) {
  const { user } = UserContainer.useContainer();

  const [invitationCode, setInvitationCode] = useState<string>("");
  const [isInvitation, setIsInvitation] = useState(true);
  const [activeStep, setActiveStep] = useState(initialState?.initialStep ?? 0);
  const steps = getSteps();

  const [bussinessCardDetailQueryResult, executeBussinessCardDetailQuery] = useBussinessCardDetailQuery({
    pause: true,
  });
  const [bussinessCardDetail, setBussinessCardDetail] = useState<BusinessCardInformation>();

  const handleNext = (): void => {
    setActiveStep((prevActiveStep) => {
      if (prevActiveStep == steps.length - 1) {
        return prevActiveStep;
      }
      return prevActiveStep + 1;
    });
  };

  useEffect(() => {
    // 未加入 team 的用户，查询是否有上传名片的任务状态
    if (!isInvitation && (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium)) {
      executeBussinessCardDetailQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [user, isInvitation]);

  useEffect(() => {
    if (!isInvitation) {
      if (bussinessCardDetailQueryResult.data) {
        const bussinessCardDetailTemp = bussinessCardDetailQueryResult.data.bussinessCardDetail;
        setBussinessCardDetail(bussinessCardDetailQueryResult.data.bussinessCardDetail);
        if (bussinessCardDetailTemp.joinStatus == JoinStatus.JoinSubmit) {
          setActiveStep(1);
          return;
        }
        if (bussinessCardDetailTemp.joinStatus == JoinStatus.JoinEnd) {
          setActiveStep(2);
          return;
        }
      }
    }
  }, [bussinessCardDetailQueryResult, isInvitation]);

  return {
    steps,
    activeStep,
    setActiveStep,
    open: initialState.open,

    onClose: initialState.onClose,
    handleNext,
    bussinessCardDetail,

    invitationCode,
    setInvitationCode,

    isInvitation,
    setIsInvitation,
  };
}

const BusinessCardVerificationDialogContainer = createContainer(useBusinessCardVerificationDialog);
export default BusinessCardVerificationDialogContainer;
