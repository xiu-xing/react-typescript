import * as React from "react";

function SvgProcess1(
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
          d="M19 8a4 4 0 110 8 4 4 0 010-8m0 1.9a2.1 2.1 0 100 4.2 2.1 2.1 0 000-4.2m0 7.1c2.67 0 8 1.33 8 4v3H11v-3c0-2.67 5.33-4 8-4m0 1.9c-3 0-6.1 1.46-6.1 2.1v1.1h12.2V21c0-.64-3.13-2.1-6.1-2.1"
          opacity={0.8}
        />
        <path d="M9 17.28l-2.5 1.49.68-2.81L5 14.08l2.87-.25L9 11.19l1.11 2.64 2.89.25-2.2 1.88.65 2.81z" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgProcess1);
export default ForwardRef;
