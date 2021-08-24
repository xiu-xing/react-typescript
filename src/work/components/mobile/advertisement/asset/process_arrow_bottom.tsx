import * as React from "react";

function SvgProcessArrawBottom(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 24 24"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"\u5207\u7247"}</title>
      <g fill="#4F709B" fillRule="nonzero">
        <path
          opacity={0.6}
          d="M15 3.107V.07l-3.362 3.231L8.455 0v3.094l3.152 3.451z"
        />
        <path
          opacity={0.8}
          d="M15 11.834V8.799l-3.362 3.23-3.183-3.302v3.095l3.152 3.45z"
        />
        <path d="M15 20.561v-3.035l-3.362 3.23-3.183-3.301v3.094L11.607 24z" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgProcessArrawBottom);
export default ForwardRef;
