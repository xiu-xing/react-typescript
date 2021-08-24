import * as React from "react";

function Svg(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 40 11"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"icon/\u53D1\u5E03\u5907\u4EFD 3"}</title>
      <g fill="#4F709B" fillRule="nonzero">
        <path
          opacity={0.6}
          d="M5.178 0H.119l5.385 5.604L0 10.909h5.157l5.752-5.254z"
        />
        <path
          opacity={0.8}
          d="M19.723 0h-5.059l5.385 5.604-5.504 5.305h5.158l5.752-5.254z"
        />
        <path d="M34.269 0H29.21l5.385 5.604-5.504 5.305h5.157L40 5.655z" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(Svg);
export default ForwardRef;
