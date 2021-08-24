import * as React from "react";

function SvgIcon6(
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
        <path d="M7.842 14.215l11.256 5.629a.58.58 0 00.508 0l11.257-5.629a.566.566 0 000-1.012L19.606 7.572a.58.58 0 00-.508 0L7.842 13.203a.566.566 0 000 1.012z" />
        <path
          d="M30.863 25.67l-2.455-1.227-7.94 3.968-1.116.56-1.116-.56-7.94-3.968-2.454 1.228a.569.569 0 000 1.015l11.256 5.628c.16.082.349.082.508 0l11.257-5.628a.569.569 0 000-1.015z"
          opacity={0.8}
        />
        <path
          d="M30.853 19.404l-2.39-1.198-7.994 3.998-1.117.56-1.116-.56-7.995-3.998-2.39 1.195a.57.57 0 000 1.022l11.244 5.622c.16.081.352.081.511 0l11.244-5.622a.567.567 0 00.003-1.019z"
          opacity={0.8}
        />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgIcon6);
export default ForwardRef;
