import * as React from "react";

function SvgIcon3(
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
        <path d="M16.726 25.893v-9.167h9.167V8.87a2.61 2.61 0 00-2.62-2.619H8.87A2.61 2.61 0 006.25 8.869v14.405a2.61 2.61 0 002.619 2.619h7.857" />
        <path
          d="M33.75 28.512v2.619a2.61 2.61 0 01-2.619 2.619h-2.62v-2.619h2.62v-2.62h2.619zm-7.857 2.619v2.619h-3.929v-2.619h3.929zm-9.167-2.62v2.62h2.62v2.619h-2.62a2.61 2.61 0 01-2.619-2.619v-2.62h2.62zm17.024-6.547v3.929h-2.619v-3.929h2.619zm-2.619-7.857a2.61 2.61 0 012.619 2.62v2.618h-2.619v-2.619h-2.62v-2.619z"
          opacity={0.8}
        />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgIcon3);
export default ForwardRef;
