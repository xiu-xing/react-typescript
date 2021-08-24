import * as React from "react";

function Svg(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 21 24"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"icon/\u53D1\u5E03\u5907\u4EFD"}</title>
      <path
        d="M10.417 13.52c.872 0 1.718.066 2.526.157l-1.224 2.448 1.054 6.29c2.487-3.595 2.852-6.81 2.852-8.191 3.125.911 5.208 2.552 5.208 4.505v5.209H0v-5.209c0-1.953 2.096-3.594 5.208-4.505 0 1.38.365 4.596 2.852 8.19l1.055-6.289-1.224-2.448a22.488 22.488 0 012.526-.156zm0-13.02a5.207 5.207 0 015.208 5.208 5.207 5.207 0 01-5.208 5.209 5.207 5.207 0 01-5.209-5.209A5.207 5.207 0 0110.417.5z"
        fill="#4F709B"
        fillRule="evenodd"
      />
    </svg>
  );
}

const ForwardRef = React.forwardRef(Svg);
export default ForwardRef;
