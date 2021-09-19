import * as React from "react";

function SvgZip(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 32 32"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <g transform="translate(2.667 1.333)" fill="none" fillRule="evenodd">
        <path
          d="M5.475 0c-.334 0-.69.133-.934.398-.244.265-.4.596-.4.928v26.44c0 .33.134.684.4.927.267.265.6.398.934.398h19.56c.334 0 .69-.133.934-.398.267-.265.4-.596.4-.928V7.513L18.812 0H5.475z"
          fill="#E9EAEE"
        />
        <rect fill="#4F709B" y={12} width={22.259} height={11.836} rx={1} />
        <path fill="#E1E3E7" d="M19.212 7.116l7.157 5.326V7.513z" />
        <path
          d="M9.36 20.96v-1H7.2l2.14-3.247V16h-3.4v.987h1.933l-2.14 3.253v.72H9.36zm2.054 0V16h-1.193v4.96h1.193zm2.381 0v-1.647h.58c1.047 0 1.96-.52 1.96-1.7 0-1.226-.9-1.613-1.993-1.613h-1.74v4.96h1.193zm.52-2.587h-.52V16.94h.487c.573 0 .893.173.893.673 0 .487-.28.76-.86.76z"
          fill="#FFF"
          fillRule="nonzero"
        />
        <path
          d="M26.37 7.513h-6.224c-.334 0-.69-.132-.934-.397a1.268 1.268 0 01-.4-.928V0l7.557 7.513z"
          fill="#A6ADBC"
          fillRule="nonzero"
        />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgZip);
export default ForwardRef;