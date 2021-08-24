import * as React from "react";

function SvgProcess3(
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
          d="M18 5l6.6 6.6v13.2a2.2 2.2 0 01-2.2 2.2H9.2A2.2 2.2 0 017 24.8V7.2A2.2 2.2 0 019.2 5H18m4.4 19.8V12.7h-5.5V7.2H9.2v17.6h13.2"
          opacity={0.8}
        />
        <path d="M14.92 21.896l-3.025-3.3 1.276-1.276 1.749 1.738 3.938-3.938 1.287 1.551z" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgProcess3);
export default ForwardRef;
