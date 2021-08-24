import * as React from "react";

function SvgWinsightsItem1(
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
        <filter id="winsights_item1_svg__a">
          <feColorMatrix
            in="SourceGraphic"
            values="0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 1.000000 0"
          />
        </filter>
      </defs>
      <g
        transform="translate(-36 -16)"
        filter="url(#winsights_item1_svg__a)"
        fill="none"
        fillRule="evenodd"
      >
        <g fill="#4F709B">
          <path d="M60.167 35.01c-1.433 0-2.808-.229-4.091-.653a1.15 1.15 0 00-1.169.287l-2.52 2.52a17.298 17.298 0 01-7.552-7.55l2.521-2.521c.321-.321.413-.768.287-1.169a13.017 13.017 0 01-.653-4.09c0-.633-.513-1.147-1.146-1.147h-4.01c-.633 0-1.147.514-1.147 1.146 0 10.758 8.722 19.48 19.48 19.48a1.146 1.146 0 001.145-1.146v-4.01c0-.634-.513-1.147-1.145-1.147z" />
          <path
            d="M59.02 31h2.292c0-5.73-4.617-10.313-10.312-10.313v2.292A8.022 8.022 0 0159.02 31"
            opacity={0.8}
          />
          <path
            d="M54.438 31h2.291A5.73 5.73 0 0051 25.27v2.293A3.438 3.438 0 0154.438 31"
            opacity={0.8}
          />
        </g>
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgWinsightsItem1);
export default ForwardRef;
