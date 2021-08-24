import * as React from "react";

function Svg(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 16 15"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"icon/24x24/file-upload-outline\u5907\u4EFD 2"}</title>
      <path
        d="M8.197 2.643l.62.613a.88.88 0 01.239.807l-.561 2.67h3.693c.643 0 1.17.52 1.17 1.17V9.07c0 .152-.03.293-.083.427l-1.765 4.12a1.16 1.16 0 01-1.075.713h-5.26a1.169 1.169 0 01-1.169-1.169V7.318c0-.321.13-.613.345-.83l3.846-3.845zm-5.36 4.675v7.013H.5V7.318h2.338zM12.644.5l.786 1.857L15.5 2.5l-1.571 1.357.5 2-1.786-1-1.786 1.072.5-2L9.786 2.57l2.071-.142L12.643.5z"
        fill="#4F709B"
        fillRule="evenodd"
      />
    </svg>
  );
}

const ForwardRef = React.forwardRef(Svg);
export default ForwardRef;
