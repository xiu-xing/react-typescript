import * as React from "react";

function SvgIcon5(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 40 40"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"\u5207\u7247"}</title>
      <g fill="#4F709B" fillRule="evenodd">
        <path
          d="M30.357 9.786A2.292 2.292 0 0028.071 7.5H9.786A2.292 2.292 0 007.5 9.786v20.571l4.571-4.571h10.286v-9.143h8V9.786"
          opacity={0.803}
        />
        <path d="M30.929 23.5h-2.515l1.943-4.571h-5.714v6.857h2.286V31.5z" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgIcon5);
export default ForwardRef;
