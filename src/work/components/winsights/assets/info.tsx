import * as React from "react";

function Svg(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 24 21"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"icon/\u53D1\u5E03\u5907\u4EFD"}</title>
      <path
        d="M12.074 0c6.366 0 11.574 4.144 11.574 9.26 0 5.115-5.208 9.259-11.574 9.259-1.377 0-2.766-.197-4.086-.58A12.77 12.77 0 01.5 20.834c2.697-2.696 3.183-4.514 3.183-5.208A8.354 8.354 0 01.5 9.259C.5 4.144 5.708 0 12.074 0zm0 2.315c-5.116 0-9.26 3.113-9.26 6.944s4.144 6.945 9.26 6.945 9.26-3.114 9.26-6.945c0-3.83-4.144-6.944-9.26-6.944zm5.787 5.787v2.315h-2.315V8.102h2.315zm-4.63 0v2.315h-2.314V8.102h2.314zm-4.63 0v2.315H6.288V8.102h2.315z"
        fill="#4F709B"
        fillRule="evenodd"
      />
    </svg>
  );
}

const ForwardRef = React.forwardRef(Svg);
export default ForwardRef;
