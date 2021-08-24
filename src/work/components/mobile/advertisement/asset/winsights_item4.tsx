import * as React from "react";

function SvgWinsightsItem4(
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
        <filter id="winsights_item4_svg__a">
          <feColorMatrix
            in="SourceGraphic"
            values="0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 1.000000 0"
          />
        </filter>
      </defs>
      <g
        transform="translate(-36 -16)"
        filter="url(#winsights_item4_svg__a)"
        fill="none"
        fillRule="evenodd"
      >
        <g fill="#4F709B">
          <path d="M48.545 35.42v-6.875h6.875v-5.893c0-1.09-.874-1.964-1.965-1.964H42.652c-1.09 0-1.965.874-1.965 1.964v10.803c0 1.09.875 1.965 1.965 1.965h5.893" />
          <path
            d="M61.313 37.384v1.964c0 1.09-.875 1.965-1.965 1.965h-1.964v-1.965h1.964v-1.964h1.964zm-5.893 1.964v1.965h-2.947v-1.965h2.947zm-6.875-1.964v1.964h1.964v1.965h-1.964a1.957 1.957 0 01-1.965-1.965v-1.964h1.965zm12.767-4.91v2.946h-1.964v-2.947h1.964zm-1.964-5.894c1.09 0 1.964.874 1.964 1.965v1.964h-1.964v-1.964h-1.964V26.58z"
            opacity={0.8}
          />
        </g>
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgWinsightsItem4);
export default ForwardRef;
