import * as React from "react";

function SvgCheckboxChecked(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 16 16"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"\u5207\u7247"}</title>
      <path
        d="M8 2c3.312 0 6 2.688 6 6s-2.688 6-6 6-6-2.688-6-6 2.688-6 6-6zm2.9 3.5L6.919 9.481 5.033 7.595 4.3 8.33l2.619 2.619 4.714-4.715L10.9 5.5z"
        fill="#4F709B"
        fillRule="evenodd"
      />
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgCheckboxChecked);
export default ForwardRef;
