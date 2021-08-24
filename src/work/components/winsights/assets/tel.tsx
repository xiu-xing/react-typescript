import * as React from "react";

function SvgIcon(
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
        <path d="M31.111 24.861c-1.736 0-3.403-.278-4.958-.792a1.394 1.394 0 00-1.417.348l-3.055 3.055c-3.931-2-7.153-5.222-9.153-9.153l3.055-3.055c.39-.389.5-.93.348-1.417a15.778 15.778 0 01-.792-4.958c0-.767-.622-1.389-1.389-1.389H8.889c-.767 0-1.389.622-1.389 1.389C7.5 21.929 18.071 32.5 31.111 32.5a1.389 1.389 0 001.389-1.389V26.25c0-.767-.622-1.389-1.389-1.389z" />
        <path
          d="M24.167 20h2.777A6.944 6.944 0 0020 13.056v2.777A4.167 4.167 0 0124.167 20"
          opacity={0.8}
        />
        <path
          d="M29.722 20H32.5c0-6.944-5.597-12.5-12.5-12.5v2.778c5.361 0 9.722 4.347 9.722 9.722"
          opacity={0.8}
        />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgIcon);
export default ForwardRef;
