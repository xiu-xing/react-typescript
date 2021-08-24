import * as React from "react";

function SvgPdf(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 28 30"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"icon/24x24/file-upload-outline\u5907\u4EFD 4"}</title>
      <g transform="translate(.667 .333)" fill="none" fillRule="evenodd">
        <path
          d="M5.475 0c-.334 0-.69.133-.934.398-.244.265-.4.596-.4.928v26.44c0 .33.134.684.4.927.267.265.6.398.934.398h19.56c.334 0 .69-.133.934-.398.267-.265.4-.596.4-.928V7.513L18.812 0H5.475z"
          fill="#E9EAEE"
        />
        <rect fill="#4F709B" y={12} width={22.259} height={11.836} rx={1} />
        <path fill="#E1E3E7" d="M19.212 7.116l7.157 5.326V7.513z" />
        <path
          d="M6.127 20.96v-1.647h.58c1.046 0 1.96-.52 1.96-1.7 0-1.226-.9-1.613-1.994-1.613h-1.74v4.96h1.194zm.52-2.587h-.52V16.94h.486c.574 0 .894.173.894.673 0 .487-.28.76-.86.76zm4.407 2.587c1.447 0 2.447-.78 2.447-2.507 0-1.726-1-2.453-2.513-2.453H9.56v4.96h1.493zm-.14-.96h-.16v-3.053h.16c.8 0 1.367.326 1.367 1.506S11.714 20 10.914 20zm4.748.96v-1.893h1.693v-.994h-1.693v-1.086h1.973V16H14.47v4.96h1.193z"
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

const ForwardRef = React.forwardRef(SvgPdf);
export default ForwardRef;
