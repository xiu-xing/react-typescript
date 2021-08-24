import { useState } from "react";
import { createContainer } from "unstated-next";
import { EntityType } from "../../generated/graphql";

export interface GraphVariables {
  graphId: string;
  entityId: string;
  entityType: EntityType;
}

function useInstitution() {
  const [graphVariables, setGraphVariables] = useState<GraphVariables>();
  return {
    graphVariables,
    setGraphVariables,
  };
}

const InstitutionContainer = createContainer(useInstitution);
export default InstitutionContainer;
