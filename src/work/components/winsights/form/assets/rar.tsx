import * as React from "react";

function SvgRar(
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
          d="M5.727 20.96v-1.747H6.3l.913 1.747h1.334L7.44 18.993c.513-.24.853-.706.853-1.433 0-1.2-.88-1.56-1.94-1.56h-1.82v4.96h1.194zm.533-2.687h-.533V16.94h.533c.567 0 .867.153.867.62 0 .467-.3.713-.867.713zm3.554 2.687l.287-1.14h1.467l.286 1.14h1.254L11.568 16H10.14l-1.54 4.96h1.213zm1.527-2.06h-1.013l.106-.42c.127-.493.26-1.073.38-1.593h.027c.133.506.26 1.1.393 1.593l.107.42zm3.528 2.06v-1.747h.573l.913 1.747h1.334l-1.107-1.967c.513-.24.853-.706.853-1.433 0-1.2-.88-1.56-1.94-1.56h-1.82v4.96h1.194zm.533-2.687h-.533V16.94h.533c.567 0 .867.153.867.62 0 .467-.3.713-.867.713z"
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

const ForwardRef = React.forwardRef(SvgRar);
export default ForwardRef;
