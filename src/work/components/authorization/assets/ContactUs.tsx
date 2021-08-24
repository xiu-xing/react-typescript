import * as React from "react";

function SvgContactUs(props: React.SVGProps<SVGSVGElement>, svgRef?: React.Ref<SVGSVGElement>) {
  return (
    <svg width="1em" height="1em" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" ref={svgRef} {...props}>
      <path
        d="M12.182 2A8.148 8.148 0 004 10.182v6.363a2.727 2.727 0 002.727 2.728h2.728V12H5.818v-1.818a6.364 6.364 0 1112.727 0V12H14.91v7.273h3.636v.909h-6.363V22h5.454a2.727 2.727 0 002.728-2.727v-9.091A8.165 8.165 0 0012.182 2z"
        fill="#4F709B"
        fillRule="evenodd"
      />
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgContactUs);
export default ForwardRef;
