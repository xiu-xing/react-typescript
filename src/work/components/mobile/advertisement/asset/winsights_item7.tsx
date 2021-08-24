import * as React from "react";

function SvgWinsightsItem7(
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
        <filter id="winsights_item7_svg__a">
          <feColorMatrix
            in="SourceGraphic"
            values="0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 1.000000 0"
          />
        </filter>
      </defs>
      <g
        transform="translate(-262 -16)"
        filter="url(#winsights_item7_svg__a)"
        fill="none"
        fillRule="evenodd"
      >
        <g fill="#4F709B">
          <path d="M266.945 26.217l9.287 4.643a.478.478 0 00.419 0l9.286-4.643a.467.467 0 000-.835l-9.286-4.646a.478.478 0 00-.42 0l-9.286 4.646a.467.467 0 000 .835z" />
          <path
            d="M285.938 35.667l-2.025-1.012-6.55 3.274-.922.462-.92-.462-6.55-3.274-2.026 1.012a.47.47 0 000 .838l9.287 4.644a.46.46 0 00.419 0l9.287-4.644a.47.47 0 000-.838z"
            opacity={0.8}
          />
          <path
            d="M285.93 30.498l-1.972-.988-6.595 3.297-.922.462-.92-.462-6.596-3.297-1.972.985a.47.47 0 000 .843l9.276 4.638c.132.067.29.067.422 0l9.276-4.638a.467.467 0 00.002-.84z"
            opacity={0.8}
          />
        </g>
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgWinsightsItem7);
export default ForwardRef;
