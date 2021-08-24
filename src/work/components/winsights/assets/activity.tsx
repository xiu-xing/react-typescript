import * as React from "react";

function SvgIcon2(
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
      <g fill="none" fillRule="evenodd">
        <path
          fill="#4F709B"
          opacity={0.8}
          d="M17.132 9.903V8h3.557v17.649h2.54l5.346 5.338-2.304 2.307-5.73-5.72v5.72l-3.26-.054v-5.49l-5.75 5.544-2.238-2.353 5.469-5.292h2.37z"
        />
        <path fill="#4F709B" d="M7.5 10v15.746h22.821V10z" />
        <path
          fill="#FFF"
          d="M18.962 21.83l-2.748-1.915-2.096 1.363-1.618-2.484 3.77-2.454L19 18.243 23.87 15l1.643 2.47-6.551 4.36z"
        />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgIcon2);
export default ForwardRef;
