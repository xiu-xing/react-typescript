import * as React from "react";

function Svg(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 36 21"
      xmlns="http://www.w3.org/2000/svg"
      ref={svgRef}
      {...props}
    >
      <title>{"icon/\u53D1\u5E03\u5907\u4EFD"}</title>
      <path
        d="M18 13.125c3.413 0 10.208 1.706 10.208 5.104v2.188H7.792v-2.188c0-3.398 6.795-5.104 10.208-5.104zm-10.631.802c-1.488.977-2.494 2.202-2.494 3.675v2.815H.5v-2.188c0-2.537 4.054-3.966 6.869-4.302zm21.262 0c2.815.335 6.869 1.765 6.869 4.302v2.188h-4.375v-2.815c0-1.473-1.006-2.698-2.494-3.675zM18 16.042c-2.231 0-4.725.729-6.169 1.458H24.17c-1.444-.73-3.938-1.458-6.169-1.458zM8.52 4.375c.526 0 1.022.117 1.46.32v.41c0 1.75.568 3.44 1.633 4.826a3.811 3.811 0 01-1.328 1.269 3.62 3.62 0 01-1.764.467 3.62 3.62 0 01-1.765-.467c-1.108-.627-1.881-1.808-1.881-3.18a3.646 3.646 0 013.646-3.645zm18.96 0a3.646 3.646 0 013.645 3.646c0 1.37-.773 2.552-1.881 3.179a3.62 3.62 0 01-1.765.467 3.62 3.62 0 01-1.764-.467 3.405 3.405 0 01-.744-.554 4.02 4.02 0 01-.584-.715 7.903 7.903 0 001.634-4.827v-.408c.437-.204.933-.321 1.458-.321zM18 0a5.104 5.104 0 110 10.208A5.104 5.104 0 0118 0zm0 2.917a2.187 2.187 0 100 4.375 2.187 2.187 0 000-4.375z"
        fill="#4F709B"
        fillRule="evenodd"
      />
    </svg>
  );
}

const ForwardRef = React.forwardRef(Svg);
export default ForwardRef;
