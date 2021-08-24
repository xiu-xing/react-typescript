import * as React from "react";

function SvgWinsightsItem6(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 30 30"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"\u5207\u7247"}</title>
      <defs>
        <filter id="winsights_item6_svg__a">
          <feColorMatrix
            in="SourceGraphic"
            values="0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 1.000000 0"
          />
        </filter>
      </defs>
      <g
        transform="translate(-36 -16)"
        filter="url(#winsights_item6_svg__a)"
        fill="none"
        fillRule="evenodd"
      >
        <g fill="#4F709B">
          <path
            opacity={0.8}
            d="M49.506 32.917V31.36h2.91v2.83h2.078l4.374 4.367-1.885 1.888-4.688-4.68v4.68l-2.668-.044V35.91l-4.704 4.536-1.83-1.925 4.474-4.33h1.939zM49.506 19.75h2.91v1.943h-2.91z"
          />
          <path d="M60.297 21.386V34.27H41.625V21.386h18.672zm-5.278 4.091l-3.985 2.653-2.233-1.557-3.085 2.009 1.324 2.032 1.715-1.116 2.248 1.567 5.36-3.568-1.344-2.02z" />
        </g>
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgWinsightsItem6);
export default ForwardRef;
