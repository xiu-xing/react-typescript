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
      <title>{"icon/\u53D1\u5E03\u5907\u4EFD"}</title>
      <path
        d="M3 5.5a12.5 12.5 0 110 15h3.412a10 10 0 100-15zM10.5 8l5 5-5 5v-3.75H.5v-2.5h10V8z"
        fill="#4F709B"
        fillRule="evenodd"
      />
    </svg>
  );
}

const ForwardRef = React.forwardRef(Svg);
export default ForwardRef;
