import * as React from "react";

function SvgProcessArrawLeft(
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
          d="M20.893 9h3.036l-3.231 3.362L24 15.545h-3.094l-3.451-3.152z"
        />
        <path
          opacity={0.8}
          d="M12.166 9h3.035l-3.23 3.362 3.302 3.183h-3.095l-3.45-3.152z"
        />
        <path d="M3.439 9h3.035l-3.23 3.362 3.301 3.183H3.451L0 12.393z" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgProcessArrawLeft);
export default ForwardRef;
