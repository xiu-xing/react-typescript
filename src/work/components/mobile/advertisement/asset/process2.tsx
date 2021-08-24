import * as React from "react";

function SvgProcess2(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 32 32"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"\u5207\u7247"}</title>
      <g fill="#4F709B" fillRule="evenodd">
        <path
          d="M9.2 5A2.2 2.2 0 007 7.2v17.6A2.2 2.2 0 009.2 27h13.2a2.2 2.2 0 002.2-2.2V11.6L18 5H9.2m0 2.2h7.7v5.5h5.5v12.1H9.2V7.2"
          opacity={0.8}
        />
        <path d="M11.4 16v2.2h8.8V16h-8.8M11.4 20.4v2.2h5.5v-2.2z" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgProcess2);
export default ForwardRef;
