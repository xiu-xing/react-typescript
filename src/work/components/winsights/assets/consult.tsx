import * as React from "react";

function SvgIcon1(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 40 40"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"\u5207\u7247"}</title>
      <g fill="#4F709B" fillRule="evenodd">
        <path d="M26.25 20V8.75c0-.69-.56-1.25-1.25-1.25H8.75c-.69 0-1.25.56-1.25 1.25v17.5l5-5H25c.69 0 1.25-.56 1.25-1.25" />
        <path
          d="M31.25 12.5h-2.5v11.25H12.5v2.5c0 .69.56 1.25 1.25 1.25H27.5l5 5V13.75c0-.69-.56-1.25-1.25-1.25z"
          opacity={0.8}
        />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgIcon1);
export default ForwardRef;
