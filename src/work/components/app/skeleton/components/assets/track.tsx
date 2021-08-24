import * as React from "react";

function SvgTrack(props: React.SVGProps<SVGSVGElement>, svgRef?: React.Ref<SVGSVGElement>) {
  return (
    <svg
      fontSize={24}
      width="1em"
      height="1em"
      viewBox="0 0 24 24"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <path
        d="M20 11.203h-1.594v-5.61h-5.601V4h-1.602v1.594h-5.61v5.61H4v1.6h1.594v5.602h5.61V20h1.6v-1.594h5.602v-5.601H20v-1.602m-3.195 5.602h-4v-1.602h-1.602v1.602H7.187v-4h1.618v-1.602H7.187V7.187h4.016v1.618h1.602V7.187h4v4.016h-1.602v1.602h1.602v4m-4-4.797c0 .44-.357.797-.797.797a.806.806 0 01-.805-.797c0-.438.367-.805.805-.805.438 0 .797.367.797.805z"
        fill="currentColor"
        fillRule="evenodd"
      />
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgTrack);
export default ForwardRef;
