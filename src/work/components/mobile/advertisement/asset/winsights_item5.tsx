import * as React from "react";

function SvgWinsightsItem5(
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
        <filter id="winsights_item5_svg__a">
          <feColorMatrix
            in="SourceGraphic"
            values="0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 0 1.000000 0 0 0 1.000000 0"
          />
        </filter>
      </defs>
      <g
        transform="translate(-262 -16)"
        filter="url(#winsights_item5_svg__a)"
        fill="none"
        fillRule="evenodd"
      >
        <g fill="#4F709B">
          <path d="M271.236 30.79a1.456 1.456 0 00-.423 1.037c0 .402.141.743.423 1.024l5.616 5.602c.297.281.644.422 1.04.422.404 0 .747-.14 1.03-.422l8.176-8.152c.29-.28.536-.664.738-1.15.202-.486.303-.93.303-1.332v-4.737c0-.394-.145-.736-.435-1.024a1.41 1.41 0 00-1.029-.433h-4.757c-.404 0-.85.1-1.338.302-.488.2-.877.446-1.167.734l-8.177 8.13zm12.208-6.552c.286-.285.631-.427 1.036-.427.403 0 .748.142 1.034.427a1.4 1.4 0 01.43 1.03c0 .403-.144.746-.43 1.03a1.414 1.414 0 01-1.034.428c-.405 0-.75-.142-1.036-.427a1.401 1.401 0 01-.428-1.03 1.4 1.4 0 01.428-1.03z" />
          <path
            d="M266.175 32.851l5.64 5.602c.299.281.647.422 1.045.422.276 0 .502-.054.678-.16.176-.106.379-.277.609-.512l-5.399-5.352a1.388 1.388 0 01-.425-1.024c0-.395.142-.74.425-1.036l8.213-8.13c.29-.288.681-.533 1.172-.734.49-.201.938-.302 1.343-.302h-2.572c-.406 0-.854.1-1.344.302-.49.2-.881.446-1.172.734l-8.213 8.13a1.452 1.452 0 00-.425 1.036c0 .402.142.743.425 1.024z"
            opacity={0.8}
          />
        </g>
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgWinsightsItem5);
export default ForwardRef;
