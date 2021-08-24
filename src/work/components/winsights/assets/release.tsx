import * as React from "react";

function Svg(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 26 26"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"icon/\u53D1\u5E03"}</title>
      <path
        d="M13 .5V3C7.477 3 3 7.477 3 13s4.477 10 10 10 10-4.477 10-10h2.5a12.5 12.5 0 01-25 0C.5 6.096 6.096.5 13 .5zm5.462 3.9l3.125 3.125-9.212 9.225H9.25v-3.125L18.462 4.4zm3.013-2.65c.212 0 .425.088.587.25L24 3.938c.325.312.325.862 0 1.187l-1.525 1.512-3.125-3.125L20.875 2a.864.864 0 01.6-.25z"
        fill="#4F709B"
        fillRule="evenodd"
      />
    </svg>
  );
}

const ForwardRef = React.forwardRef(Svg);
export default ForwardRef;
