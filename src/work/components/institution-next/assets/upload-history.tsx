import * as React from "react";

function SvgIcon24X24FileUploadOutline2(props: React.SVGProps<SVGSVGElement>, svgRef?: React.Ref<SVGSVGElement>) {
  return (
    <svg width="1em" height="1em" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" ref={svgRef} {...props}>
      <g strokeWidth={0.6} fill="none" fillRule="evenodd">
        <path
          d="M12.5 19.3c3.757 0 6.8-3.043 6.8-6.8 0-3.757-3.043-6.8-6.8-6.8a6.798 6.798 0 00-6.8 6.8c0 3.757 3.043 6.8 6.8 6.8m0-15.3c4.692 0 8.5 3.808 8.5 8.5S17.192 21 12.5 21C7.8 21 4 17.175 4 12.5 4 7.808 7.808 4 12.5 4"
          stroke="#7491B7"
          fill="#7491B7"
        />
        <path stroke="#4F709B" fill="#4F709B" d="M12.925 8.25v4.463l3.825 2.269-.637 1.046-4.463-2.678v-5.1z" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgIcon24X24FileUploadOutline2);
export default ForwardRef;
