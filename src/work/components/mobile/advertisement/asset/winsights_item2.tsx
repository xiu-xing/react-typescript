import * as React from "react";

function SvgWinsightsItem2(
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
        <filter id="winsights_item2_svg__a">
          <feColorMatrix
            in="SourceGraphic"
            values="0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 1.000000 0"
          />
        </filter>
      </defs>
      <g
        transform="translate(-262 -16)"
        filter="url(#winsights_item2_svg__a)"
        fill="none"
        fillRule="evenodd"
      >
        <g fill="#4F709B">
          <path d="M282.156 31v-9.281c0-.57-.461-1.032-1.031-1.032h-13.406c-.57 0-1.031.462-1.031 1.032v14.437l4.125-4.125h10.312c.57 0 1.031-.461 1.031-1.031" />
          <path
            d="M286.281 24.813h-2.062v9.28h-13.406v2.063c0 .57.461 1.032 1.03 1.032h11.344l4.125 4.124V25.845c0-.57-.461-1.032-1.03-1.032z"
            opacity={0.8}
          />
        </g>
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgWinsightsItem2);
export default ForwardRef;
