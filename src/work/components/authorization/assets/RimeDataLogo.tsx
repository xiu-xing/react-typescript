import * as React from "react";

function SvgRimeData(props: React.SVGProps<SVGSVGElement>, svgRef?: React.Ref<SVGSVGElement>) {
  return (
    <svg width="1em" height="1em" viewBox="0 0 110 18" xmlns="http://www.w3.org/2000/svg" ref={svgRef} {...props}>
      <path
        d="M79.303 3.3c1.478 0 2.819.619 4.022 1.856V3.988c0-.207.172-.344.344-.344h2.303c.172 0 .31.172.344.343V16.5h-2.991v-1.34c-1.237 1.134-2.544 1.718-3.953 1.718-1.788 0-3.231-.653-4.4-1.925-1.134-1.306-1.719-2.956-1.719-4.915 0-1.925.585-3.541 1.719-4.813C76.14 3.953 77.584 3.3 79.303 3.3zm22.481 0c1.478 0 2.82.619 4.022 1.856V3.988c0-.207.172-.344.344-.344h2.303c.206 0 .344.172.344.343V16.5h-2.99v-1.34c-1.238 1.134-2.544 1.718-3.954 1.718-1.787 0-3.231-.653-4.4-1.925-1.134-1.306-1.719-2.956-1.719-4.915 0-1.925.585-3.541 1.72-4.813 1.168-1.272 2.612-1.925 4.33-1.925zM62.837.31c5.397 0 9.832 4.915 8.594 10.174-.86 3.678-3.987 6.291-7.7 6.325v-3.093a4.983 4.983 0 004.847-4.985c0-3.06-2.2-5.5-4.95-5.5h-1.753V16.81h-3.094V.653c0-.206.138-.344.344-.344zM8.285.31c3.025 0 5.466 2.337 5.466 5.224 0 2.475-1.787 4.538-4.16 5.088l4.16 6.187h-3.678l-4.056-6.015h-1.72v5.981H1.204V8.181c0-.206.138-.343.344-.343h6.737c1.41 0 2.544-1.032 2.544-2.304 0-1.271-1.134-2.303-2.544-2.303H1.547c-.206 0-.344-.137-.344-.343V.653c0-.206.138-.344.344-.344zM18.7 7.871a.37.37 0 01.344.344v8.593H15.95V8.216c0-.207.137-.344.344-.344zm16.534-4.64c2.922 0 4.4 1.787 4.4 5.396v8.147H36.61V9.453c0-1.272-.137-2.165-.447-2.681-.309-.516-.825-.79-1.546-.79-.825 0-1.444.343-1.822.962-.378.653-.585 1.65-.585 3.06v6.805h-3.025V9.522c0-2.372-.687-3.54-2.028-3.54-.825 0-1.478.309-1.856.996-.378.619-.584 1.65-.584 3.025v6.806h-3.094V4.194c0-.207.137-.344.344-.344h2.406c.206 0 .344.137.344.344v.619c.584-.62 1.065-1.032 1.512-1.238.447-.24.997-.344 1.65-.344 1.478 0 2.613.653 3.506 1.96.963-1.307 2.235-1.96 3.85-1.96zM92.4.308c.206 0 .344.138.344.344v3.781h1.478c.206 0 .344.138.378.344v2.406c0 .207-.137.344-.344.344h-1.478v9.281h-3.094V7.53h-.996c-.207 0-.344-.138-.344-.345V4.778c0-.206.137-.344.344-.344h.962V.654c0-.207.137-.345.344-.345zM48.125 3.231c3.747 0 6.806 3.06 6.806 6.806 0 .447-.069.86-.137 1.272H44.069c.55 1.72 2.131 2.991 4.056 2.991 1.272 0 2.372-.584 3.128-1.478h3.025c-1.066 2.337-3.403 3.987-6.153 3.987-3.747 0-6.772-3.093-6.772-6.806 0-3.712 3.025-6.772 6.772-6.772zm31.694 2.75c-.997 0-1.856.378-2.544 1.169-.688.756-1.031 1.753-1.031 2.887 0 1.238.344 2.235.997 3.025.653.791 1.512 1.17 2.543 1.17 1.1 0 1.994-.379 2.682-1.135.687-.79 1.03-1.788 1.03-2.99 0-1.204-.343-2.2-1.03-2.991-.688-.757-1.582-1.135-2.647-1.135zm22.515 0c-.996 0-1.856.378-2.543 1.169-.688.756-1.032 1.753-1.032 2.887 0 1.238.344 2.235.997 3.025.653.791 1.513 1.17 2.544 1.17 1.1 0 1.994-.379 2.681-1.135.688-.79 1.032-1.788 1.032-2.99 0-1.204-.344-2.2-1.032-2.991-.687-.757-1.581-1.135-2.647-1.135zm-54.209-.206c-1.925 0-3.506 1.272-4.056 2.99h8.112c-.55-1.718-2.131-2.99-4.056-2.99zM18.7 3.231a.37.37 0 01.344.344v2.406c0 .207-.138.344-.344.344h-2.406c-.207 0-.344-.138-.344-.344V3.575c0-.206.137-.344.344-.344z"
        fill="#4F709B"
        fillRule="evenodd"
      />
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgRimeData);
export default ForwardRef;
