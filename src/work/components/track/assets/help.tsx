import * as React from "react";

function SvgHelp(
  props: React.SVGProps<SVGSVGElement>,
  svgRef?: React.Ref<SVGSVGElement>
) {
  return (
    <svg
      width="1em"
      height="1em"
      viewBox="0 0 481 327"
      xmlns="http://www.w3.org/2000/svg"
      xmlnsXlink="http://www.w3.org/1999/xlink"
      ref={svgRef}
      {...props}
    >
      <title>{"\u5E7F\u544A1"}</title>
      <defs>
        <filter
          x="-6.3%"
          y="-9.9%"
          width="112.7%"
          height="119.9%"
          filterUnits="objectBoundingBox"
          id="help_svg__a"
        >
          <feGaussianBlur
            stdDeviation="7.6532968 -4.73572044"
            in="SourceGraphic"
          />
        </filter>
        <filter
          x="-7.6%"
          y="-18.1%"
          width="115.1%"
          height="145.4%"
          filterUnits="objectBoundingBox"
          id="help_svg__f"
        >
          <feMorphology
            radius={0.4}
            operator="dilate"
            in="SourceAlpha"
            result="shadowSpreadOuter1"
          />
          <feOffset
            dy={1.1}
            in="shadowSpreadOuter1"
            result="shadowOffsetOuter1"
          />
          <feGaussianBlur
            stdDeviation={1.5}
            in="shadowOffsetOuter1"
            result="shadowBlurOuter1"
          />
          <feComposite
            in="shadowBlurOuter1"
            in2="SourceAlpha"
            operator="out"
            result="shadowBlurOuter1"
          />
          <feColorMatrix
            values="0 0 0 0 0.309803922 0 0 0 0 0.439215686 0 0 0 0 0.607843137 0 0 0 0.08 0"
            in="shadowBlurOuter1"
          />
        </filter>
        <filter
          x="-7%"
          y="-16.5%"
          width="114%"
          height="142.1%"
          filterUnits="objectBoundingBox"
          id="help_svg__h"
        >
          <feOffset dy={1.1} in="SourceAlpha" result="shadowOffsetOuter1" />
          <feGaussianBlur
            stdDeviation={1.5}
            in="shadowOffsetOuter1"
            result="shadowBlurOuter1"
          />
          <feColorMatrix
            values="0 0 0 0 0.309803922 0 0 0 0 0.439215686 0 0 0 0 0.607843137 0 0 0 0.104895105 0"
            in="shadowBlurOuter1"
          />
        </filter>
        <filter
          x="-7%"
          y="-16.5%"
          width="114%"
          height="142.1%"
          filterUnits="objectBoundingBox"
          id="help_svg__j"
        >
          <feOffset dy={1.1} in="SourceAlpha" result="shadowOffsetOuter1" />
          <feGaussianBlur
            stdDeviation={1.5}
            in="shadowOffsetOuter1"
            result="shadowBlurOuter1"
          />
          <feColorMatrix
            values="0 0 0 0 0.309803922 0 0 0 0 0.439215686 0 0 0 0 0.607843137 0 0 0 0.104895105 0"
            in="shadowBlurOuter1"
          />
        </filter>
        <filter
          x="-7%"
          y="-16.5%"
          width="114%"
          height="142.1%"
          filterUnits="objectBoundingBox"
          id="help_svg__l"
        >
          <feOffset dy={1.1} in="SourceAlpha" result="shadowOffsetOuter1" />
          <feGaussianBlur
            stdDeviation={1.5}
            in="shadowOffsetOuter1"
            result="shadowBlurOuter1"
          />
          <feColorMatrix
            values="0 0 0 0 0.309803922 0 0 0 0 0.439215686 0 0 0 0 0.607843137 0 0 0 0.104895105 0"
            in="shadowBlurOuter1"
          />
        </filter>
        <filter
          x="-7%"
          y="-16.5%"
          width="114%"
          height="142.1%"
          filterUnits="objectBoundingBox"
          id="help_svg__n"
        >
          <feOffset dy={1.1} in="SourceAlpha" result="shadowOffsetOuter1" />
          <feGaussianBlur
            stdDeviation={1.5}
            in="shadowOffsetOuter1"
            result="shadowBlurOuter1"
          />
          <feColorMatrix
            values="0 0 0 0 0.309803922 0 0 0 0 0.439215686 0 0 0 0 0.607843137 0 0 0 0.104895105 0"
            in="shadowBlurOuter1"
          />
        </filter>
        <filter
          x="-6%"
          y="-3.3%"
          width="112.1%"
          height="109.3%"
          filterUnits="objectBoundingBox"
          id="help_svg__q"
        >
          <feOffset dy={2} in="SourceAlpha" result="shadowOffsetOuter1" />
          <feGaussianBlur
            stdDeviation={2}
            in="shadowOffsetOuter1"
            result="shadowBlurOuter1"
          />
          <feColorMatrix
            values="0 0 0 0 0.364705882 0 0 0 0 0.529411765 0 0 0 0 0.949019608 0 0 0 0.2089434 0"
            in="shadowBlurOuter1"
          />
        </filter>
        <filter
          x="-35.2%"
          y="-22.9%"
          width="170.3%"
          height="164.2%"
          filterUnits="objectBoundingBox"
          id="help_svg__s"
        >
          <feOffset dy={2} in="SourceAlpha" result="shadowOffsetOuter1" />
          <feGaussianBlur
            stdDeviation={2}
            in="shadowOffsetOuter1"
            result="shadowBlurOuter1"
          />
          <feColorMatrix
            values="0 0 0 0 0.309803922 0 0 0 0 0.439215686 0 0 0 0 0.607843137 0 0 0 0.188237544 0"
            in="shadowBlurOuter1"
          />
        </filter>
        <linearGradient
          x1="34.378%"
          y1="92.407%"
          x2="63.309%"
          y2="20.327%"
          id="help_svg__b"
        >
          <stop stopColor="#535863" offset="0%" />
          <stop stopColor="#2C2F37" offset="100%" />
        </linearGradient>
        <linearGradient
          x1="50%"
          y1="12.796%"
          x2="50%"
          y2="99.467%"
          id="help_svg__c"
        >
          <stop stopColor="#24262D" offset="0%" />
          <stop stopColor="#434B55" offset="100%" />
        </linearGradient>
        <linearGradient x1="50%" y1="0%" x2="50%" y2="100%" id="help_svg__d">
          <stop stopColor="#1E35A9" offset="0%" />
          <stop stopColor="#385EC4" offset="100%" />
        </linearGradient>
        <linearGradient
          x1="0%"
          y1="44.038%"
          x2="86.591%"
          y2="70.054%"
          id="help_svg__e"
        >
          <stop stopColor="#2540B0" offset="0%" />
          <stop stopColor="#2A5DC0" offset="100%" />
        </linearGradient>
        <linearGradient
          x1="48.051%"
          y1="4.479%"
          x2="51.949%"
          y2="100%"
          id="help_svg__u"
        >
          <stop stopColor="#D4DBDF" offset="0%" />
          <stop stopColor="#D8D8D8" offset="100%" />
        </linearGradient>
        <linearGradient
          x1="112.566%"
          y1="10.253%"
          x2="-19.859%"
          y2="99.42%"
          id="help_svg__v"
        >
          <stop stopColor="#D1D9DE" offset="0%" />
          <stop stopColor="#D8DEE1" offset="100%" />
        </linearGradient>
        <rect id="help_svg__g" x={0} y={0} width={72} height={24} rx={2} />
        <rect id="help_svg__i" x={0} y={0} width={72} height={24} rx={2} />
        <rect id="help_svg__k" x={0} y={0} width={72} height={24} rx={2} />
        <rect id="help_svg__m" x={0} y={0} width={72} height={24} rx={2} />
        <rect id="help_svg__o" x={0} y={0} width={72} height={24} rx={2} />
        <rect id="help_svg__p" x={0} y={0} width={116} height={150} rx={2} />
        <path
          id="help_svg__t"
          d="M.913.194l4.545 20.7 6.482-4.437 4.795 5.556 3.44-2.733-4.235-5.57 4.878-3.24z"
        />
      </defs>
      <g fill="none" fillRule="evenodd">
        <path
          d="M81.585 122.914C56.545 107.65-5.208 30.582 61.588 30.582c44.531 0 97.74-8.978 159.626-26.933C346.15-5.161 407 2.2 403.762 25.732c-3.237 23.532 3.333 46.6 19.71 69.204 9.05 45.01-2.225 75.693-33.826 92.051-11.252 5.825-17.422 12.479-18.51 19.962-4.29 29.51-28.978 51.785-58.771 53.028l-289.4 12.072c-30.8-23.992-29.937-41.44 2.587-52.346 32.525-10.905 55.713-27.263 69.565-49.074 7.672-21.634 3.162-37.539-13.532-47.715z"
          fill="#EBF1FF"
          opacity={0.245}
          filter="url(#help_svg__a)"
          transform="translate(27 27)"
        />
        <path
          d="M144.178 161.71c-1.119-.067-10.062-2.069-11.892-1.286-.315.135-1.435.014-1.72.475-.504.818-1.182 2.167-1.036 3.39.046.387 1.234.893 3.562 1.518 2.544.614 4.191.617 4.941.009.75-.609 1.188-1.462 1.314-2.56 1.575.149 2.888.243 3.94.28 1.58.058 2.01-1.76.89-1.826z"
          fill="#F1B282"
        />
        <path
          d="M131.587 159.42c.327.017-.727 6.68-1.093 6.67-3.697-.089-20.366-1.652-22.502-3.913 4.693-9.683 7.955-14.91 9.787-15.68 1.14-.479 1.63 3.018 1.473 10.492 0 0 6.561 2.144 12.335 2.432z"
          fill="#355AC1"
          fillRule="nonzero"
        />
        <path
          d="M100.764 235.591l-.325 3.817s.533 2.087-2.659 1.399c-3.192-.689-3.039-2.192-3.039-2.192s.4-4.585.532-4.878c.13-.294 5.491 1.854 5.491 1.854z"
          fill="#F1B282"
          fillRule="nonzero"
        />
        <path
          d="M100.738 237.43c.34-.35.879-.409 1.288-.141 1.43.936 4.473 2.922 4.659 2.999 1.632.679 6.014 1.808 5.954 3.479-.064 1.75-12.846.824-17.523.427a1.807 1.807 0 01-1.65-1.843l.086-3.873a.547.547 0 01.835-.46c.768.468 1.966 1.083 3.081 1.174 1.24.098 2.55-1.024 3.27-1.762z"
          fill="#2F4062"
          fillRule="nonzero"
        />
        <path
          d="M79.535 229.494l-2.126 3.18s-.873 1.938-3.332-.218c-2.46-2.157-1.225-3.256-1.225-3.256s2.562-3.816 2.819-4.008c.255-.194 3.864 4.302 3.864 4.302z"
          fill="#F1B282"
          fillRule="nonzero"
        />
        <path
          d="M78.066 231.826a.984.984 0 011.101.588c.643 1.527 2.013 4.77 2.12 4.932.94 1.43 3.833 4.718 2.896 6.019-.98 1.363-10.679-6.336-14.195-9.2a1.763 1.763 0 01-.335-2.37l2.128-3.045a.522.522 0 01.479-.222.531.531 0 01.431.309c.363.792.992 1.935 1.833 2.615.934.754 2.575.571 3.542.374z"
          fill="#2F4062"
          fillRule="nonzero"
        />
        <path
          d="M41.128 85.88c-11.85 11.519-22.083 19.83-30.702 24.934-.524.31-1.145-.041-1.428-.544l-2.892-5.337a1.313 1.313 0 01.42-1.737l22.901-20.018 3.187-24.262 8.595 1.358-.081 25.605z"
          fill="url(#help_svg__b)"
          fillRule="nonzero"
          transform="rotate(-13 567.472 -139.665)"
        />
        <path
          d="M18.824 54.546c-.228 8.006 21.07 23.237 21.868 31.005.687 6.703-2.712 29.268-1.48 33.425.174.584.761.942 1.357.824l5.258-1.146c.379-.075.709-.306.91-.636.2-.33.253-.731.146-1.104-1.201-4.2 7.457-32.3 6.768-35.934-.839-4.422-11.056-14.861-14.678-22.083-3.622-7.22-20.149-4.351-20.149-4.351z"
          fill="url(#help_svg__c)"
          fillRule="nonzero"
          transform="rotate(17 -321.589 360.86)"
        />
        <path
          d="M116.833 173.98s4.464.664 6.318 1.566c1.854.902 4.445 2.846 4.942 3.276.28.243.962.992.839 1.51-.138.58-1.401 1.233-1.73 1.263-.408.036-5.795.063-7.803-.98-2.009-1.044-5.573-3.926-5.573-3.926l3.007-2.709zM128.85 130.458c-.234 1.968-1.285 2.329-1.54 3.038-.255.709-.375 2.444-.794 2.988-.418.544-1.302-.019-2.073.52-.772.54-1.079 1.779-2.317 2.012-1.238.233-3.487-1.773-3.947-.982-.459.792-1.18 4.49-1.18 4.49l-6.837-5.09s3.637-3.39 4.478-5.301c.84-1.912 4.656-8.372 7.296-7.478 2.64.894 7.161 3.713 6.913 5.803z"
          fill="#F1B282"
          fillRule="nonzero"
        />
        <path
          d="M125.411 122.016c3.413 2.293 5.207 3.094 6.029 1.864 1.076.725 1.76 3.802.28 6.017-3.273 4.893-8.335-1.544-10.152 1.173-.009.006-1.723 3.867-1.216 4.934.507 1.069 3.346.476 4.085.927.598.366-.737 7.59-5.035 4.703-4.297-2.888 2.03-10.813-.6-12.58-1.335-.898-3.705 5.508-5.54 4.274-1.685-1.132-2.1-4.676.864-9.109 3.228-4.824 8.258-4.238 11.285-2.203z"
          fill="#0B224E"
          fillRule="nonzero"
        />
        <path
          d="M37.86 62.452c-5-.719-7.53.346-8.723-5.034-1.192-5.38 2.885-11.821 3.716-17.32 1.542-13.864 7.133-20.197 9.037-20.555 1.24-.233 4.248 1.587 6.194 2.884a6.954 6.954 0 012.675 3.37c3.447 9.375-.053 17.081-.051 22.202 0 1.665 1.735 11.57 2.138 13.024.689 2.502-10.052 2.139-14.986 1.43z"
          fill="url(#help_svg__d)"
          fillRule="nonzero"
          transform="rotate(12 -481.53 406.201)"
        />
        <path
          d="M113.052 173.932c-3.914-1.92-11.289-5.976-12.304-9.731-1.396-5.147 7.003-14.681 7.003-14.681-3.667 8.198-4.806 17.839 1.919 19.732 1.021.286 2.198.51 3.475.672.014.255.027.509.047.765l-.14 3.243z"
          fill="#2F47B1"
          fillRule="nonzero"
        />
        <path
          d="M59.018 55.069c-.338.281-17.649 6.292-23.562 2.903-5.914-3.39-3.038-17.991-3.038-17.991l8.2 1.465-.216 8.002s10.045-.375 13.8-1.357a1.355 1.355 0 011.501.607c1.16 1.899 3.657 6.085 3.315 6.37z"
          fill="url(#help_svg__e)"
          fillRule="nonzero"
          transform="rotate(51 -44.607 175.363)"
        />
        <g>
          <g transform="translate(151 150)">
            <use
              fill="#000"
              filter="url(#help_svg__f)"
              xlinkHref="#help_svg__g"
            />
            <use
              stroke="#4F709B"
              strokeWidth={0.8}
              fill="#FFF"
              xlinkHref="#help_svg__g"
            />
          </g>
          <path
            fill="#B8D0EF"
            opacity={0.317}
            d="M158.714 155.333h12.857v13.333h-12.857z"
          />
          <path
            fill="#EAF2FC"
            d="M175.429 155.333h41.143V162h-41.143zM175.429 164.667h18v4h-18z"
          />
          <g transform="translate(151 119)">
            <use
              fill="#000"
              filter="url(#help_svg__h)"
              xlinkHref="#help_svg__i"
            />
            <use fill="#FFF" xlinkHref="#help_svg__i" />
          </g>
          <path
            fill="#B8D0EF"
            opacity={0.317}
            d="M158.714 124.333h12.857v13.333h-12.857z"
          />
          <path
            fill="#EAF2FC"
            d="M175.429 124.333h41.143V131h-41.143zM175.429 133.667h18v4h-18z"
          />
          <g>
            <g transform="translate(151 182)">
              <use
                fill="#000"
                filter="url(#help_svg__j)"
                xlinkHref="#help_svg__k"
              />
              <use fill="#FFF" xlinkHref="#help_svg__k" />
            </g>
            <path
              fill="#B8D0EF"
              opacity={0.317}
              d="M158.714 187.333h12.857v13.333h-12.857z"
            />
            <path
              fill="#EAF2FC"
              d="M175.429 187.333h41.143V194h-41.143zM175.429 196.667h18v4h-18z"
            />
          </g>
          <g>
            <g transform="translate(151 88)">
              <use
                fill="#000"
                filter="url(#help_svg__l)"
                xlinkHref="#help_svg__m"
              />
              <use fill="#FFF" xlinkHref="#help_svg__m" />
            </g>
            <path
              fill="#B8D0EF"
              opacity={0.317}
              d="M158.714 93.333h12.857v13.333h-12.857z"
            />
            <path
              fill="#EAF2FC"
              d="M175.429 93.333h41.143V100h-41.143zM175.429 102.667h18v4h-18z"
            />
          </g>
          <g>
            <g transform="translate(151 213)">
              <use
                fill="#000"
                filter="url(#help_svg__n)"
                xlinkHref="#help_svg__o"
              />
              <use fill="#FFF" xlinkHref="#help_svg__o" />
            </g>
            <path
              fill="#B8D0EF"
              opacity={0.317}
              d="M158.714 218.333h12.857v13.333h-12.857z"
            />
            <path
              fill="#EAF2FC"
              d="M175.429 218.333h41.143V225h-41.143zM175.429 227.667h18v4h-18z"
            />
          </g>
          <g transform="translate(261 88)">
            <mask id="help_svg__r" fill="#fff">
              <use xlinkHref="#help_svg__p" />
            </mask>
            <use
              fill="#000"
              filter="url(#help_svg__q)"
              xlinkHref="#help_svg__p"
            />
            <use fill="#FFF" xlinkHref="#help_svg__p" />
            <path
              fill="#B8D0EF"
              opacity={0.317}
              mask="url(#help_svg__r)"
              d="M7.82 7.895h9.124v9.211H7.82z"
            />
            <path
              fill="#EAF2FC"
              opacity={0.8}
              mask="url(#help_svg__r)"
              d="M19.551 9.211h41.708v6.579H19.551zM19.551 21.053h88.629v17.105H19.551zM19.551 80.263h88.629v17.105H19.551zM19.551 139.474h88.629v17.105H19.551zM19.551 40.789h24.764v5.263H19.551zM19.551 100h24.764v5.263H19.551zM19.551 67.105h24.764v5.263H19.551zM19.551 126.316h24.764v5.263H19.551zM19.551 53.947h88.629v10.526H19.551zM19.551 113.158h88.629v10.526H19.551z"
            />
            <path
              stroke="#EEF4FD"
              strokeWidth={0.6}
              strokeLinecap="square"
              mask="url(#help_svg__r)"
              d="M12.382 24.342v126.316"
            />
            <ellipse
              stroke="#EEF4FD"
              strokeWidth={0.6}
              fill="#FFF"
              mask="url(#help_svg__r)"
              cx={12.382}
              cy={23.026}
              rx={1.655}
              ry={1.674}
            />
            <ellipse
              stroke="#EEF4FD"
              strokeWidth={0.6}
              fill="#FFF"
              mask="url(#help_svg__r)"
              cx={12.382}
              cy={55.921}
              rx={1.655}
              ry={1.674}
            />
            <ellipse
              stroke="#EEF4FD"
              strokeWidth={0.6}
              fill="#FFF"
              mask="url(#help_svg__r)"
              cx={12.382}
              cy={82.237}
              rx={1.655}
              ry={1.674}
            />
            <ellipse
              stroke="#EEF4FD"
              strokeWidth={0.6}
              fill="#FFF"
              mask="url(#help_svg__r)"
              cx={12.382}
              cy={115.132}
              rx={1.655}
              ry={1.674}
            />
            <ellipse
              stroke="#EEF4FD"
              strokeWidth={0.6}
              fill="#FFF"
              mask="url(#help_svg__r)"
              cx={12.382}
              cy={141.447}
              rx={1.655}
              ry={1.674}
            />
          </g>
          <g transform="translate(221 124)" stroke="#4F709B" strokeWidth={0.8}>
            <path d="M2.395 41.412c.414-9.775 6.871-15.118 19.371-16.026 12.5-.91 18.71-8.508 18.628-22.798" />
            <ellipse fill="#FFF" cx={2.606} cy={41.412} rx={2.206} ry={2.188} />
            <ellipse fill="#FFF" cx={40.394} cy={2.588} rx={2.206} ry={2.188} />
          </g>
        </g>
        <g>
          <g transform="translate(393 202)">
            <use
              fill="#000"
              filter="url(#help_svg__s)"
              xlinkHref="#help_svg__t"
            />
            <use fill="#FFF" xlinkHref="#help_svg__t" />
          </g>
          <path
            fill="url(#help_svg__u)"
            d="M.913.194v4.001l4.5 18.788v-2.258z"
            transform="translate(393 202)"
          />
          <path
            fill="url(#help_svg__v)"
            d="M12.02 16.414v2.07l-6.608 4.499v-2.214z"
            transform="translate(393 202)"
          />
          <path
            fill="#CED5D9"
            d="M410.037 217.128l4.378-3.039-.597-1.636-4.878 3.257z"
          />
          <path fill="#CAD2D8" d="M405.02 218.414v2.07l4.608 5.148.107-1.62z" />
          <path
            fill="#C4CBD0"
            d="M409.735 224.013l-.107 1.62 3.466-2.894.082-1.459z"
          />
        </g>
        <g fill="#9EB1CE">
          <path d="M136.312 75.413l-3.941 1.327-4.701-10.196 4.383-1.826zM128.177 81.455l-2.78 3.656-9.513-7.65 2.771-3.969zM123.516 90.63l-1.573 4.399-10.234-3.787 1.574-4.399z" />
        </g>
        <text
          fontFamily="NotoSansSC-Medium, Noto Sans SC Medium"
          fontSize={18}
          letterSpacing={0.25}
          fill="#666"
          transform="translate(27 27)"
        >
          <tspan x={133} y={272}>
            {"\u70B9\u51FB\u4E00\u884C\u6570\u636E\u8BD5\u8BD5\u5427"}
          </tspan>
        </text>
      </g>
    </svg>
  );
}

const ForwardRef = React.forwardRef(SvgHelp);
export default ForwardRef;
