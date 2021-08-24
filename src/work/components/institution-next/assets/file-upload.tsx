import * as React from "react";

function SvgIcon24X24FileUploadOutline(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 24 24"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"\u5207\u7247"}</title>
      <g fill="none" fillRule="evenodd">
        <path
          fill="#4F709B"
          d="M12.004 9.337l4.184 4.184-1.673 1.673-1.327-1.327v5.69H10.82v-5.69l-1.327 1.327-1.674-1.673z"
        />
        <path
          d="M16.873 18.094h-.782v-.004h-.001a1.184 1.184 0 01-1.085-1.146v-.033c0-.61.46-1.112 1.052-1.177l.034-.003v-.004H16.918a2.663 2.663 0 10-.206-5.32l-.08.005-.939.084-.292-.895a4.677 4.677 0 00-9.119 1.365v.077l.006.839-.764.294c-.67.26-1.12.898-1.135 1.617v.159c0 .98.794 1.775 1.774 1.775H7.82a1.183 1.183 0 110 2.366H6.163a4.142 4.142 0 01-4.141-4.073v-.186c-.001-1.411.717-2.725 1.904-3.487l.025-.016.01-.083a7.043 7.043 0 016.879-6.236h.116a7.044 7.044 0 016.363 4.02l.01.023.038.004a5.03 5.03 0 014.535 4.922v.083c0 2.72-2.159 4.94-4.873 5.027l-.083.002h-.073z"
          fill="#7491B7"
        />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgIcon24X24FileUploadOutline);
export default ForwardRef;
