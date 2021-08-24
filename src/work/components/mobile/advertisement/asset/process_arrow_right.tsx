import * as React from "react";

function SvgProcessArrawRight(
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
          d="M3.107 9H.07l3.231 3.362L0 15.545h3.094l3.451-3.152z"
        />
        <path
          opacity={0.8}
          d="M11.834 9H8.799l3.23 3.362-3.302 3.183h3.095l3.45-3.152z"
        />
        <path d="M20.561 9h-3.035l3.23 3.362-3.301 3.183h3.094L24 12.393z" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgProcessArrawRight);
export default ForwardRef;
