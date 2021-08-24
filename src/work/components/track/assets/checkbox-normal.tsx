import * as React from "react";

function SvgCheckboxNormal(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 16 16"
      xmlns="http://www.w3.org/2000/svg"
      xmlnsXlink="http://www.w3.org/1999/xlink"
      ref={svgRef}
      {...props}
    >
      <title>{"\u5207\u7247"}</title>
      <defs>
        <path
          d="M8 2C4.688 2 2 4.688 2 8s2.688 6 6 6 6-2.688 6-6-2.688-6-6-6zm0 10.8A4.799 4.799 0 013.2 8c0-2.652 2.148-4.8 4.8-4.8 2.652 0 4.8 2.148 4.8 4.8 0 2.652-2.148 4.8-4.8 4.8z"
          id="checkbox-normal_svg__a"
        />
      </defs>
      <g fill="none" fillRule="evenodd">
        <path d="M0 0h16v16H0z" />
        <use fill="#191919" opacity={0.5} xlinkHref="#checkbox-normal_svg__a" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgCheckboxNormal);
export default ForwardRef;
