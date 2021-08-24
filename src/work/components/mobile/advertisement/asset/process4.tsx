import * as React from "react";

function SvgProcess4(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 32 32"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"\u5207\u7247"}</title>
      <g fill="#4F709B" fillRule="evenodd">
        <path
          d="M24.8 22.4H7.2V9.2h17.6m0-2.2H7.2C5.979 7 5 7.979 5 9.2v13.2a2.2 2.2 0 002.2 2.2h17.6a2.2 2.2 0 002.2-2.2V9.2A2.2 2.2 0 0024.8 7"
          opacity={0.8}
        />
        <path d="M13.842 10.96H12.26l1.83 3.747H12.53v1.555h2.318l.287.586H12.53v1.555h2.675l.001 2.677h1.555v-2.677h2.677v-1.555h-2.632l.308-.586h2.324v-1.555h-1.562l1.83-3.747h-1.58l-.219.136-1.923 3.944-1.924-3.944z" />
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgProcess4);
export default ForwardRef;
