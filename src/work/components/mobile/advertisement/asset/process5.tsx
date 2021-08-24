import * as React from "react";

function SvgProcess5(
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
          d="M24.2 8A1.8 1.8 0 0126 9.8v10.8a1.8 1.8 0 01-1.8 1.8H11.6L8 26V9.8C8 8.801 8.81 8 9.8 8h14.4M9.8 9.8v11.853l1.053-1.053H24.2V9.8H9.8"
          opacity={0.8}
        />
        <path d="M11.6 12.5h10.8v1.8H11.6v-1.8M11.6 16.1h8.1v1.8h-8.1z" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgProcess5);
export default ForwardRef;
