import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Eye } from "mdi-material-ui";
import React from "react";
import { NextSearchConditionInput } from "../../../generated/graphql";
import AdvancedSearchContainer from "../container";
import TemplateCard from "./template-card";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    tip: {
      color: "#999",
      fontSize: "0.875rem",
      lineHeight: 1.72,
      fontWeight: theme.typography.fontWeightMedium,
    },
  }),
);

interface PresetTemplatesProps {}

const PresetTemplates: React.FC<PresetTemplatesProps> = (props) => {
  const classes = useStyles();
  const { presetTemplates, updateConditions, setTitle } = AdvancedSearchContainer.useContainer();

  return (
    <>
      <Box padding="0 24px" className={classes.root} maxWidth={1699} margin="auto">
        <Box height={16} />
        <Box>
          <Box textAlign="center">
            <svg
              width="257px"
              height="170px"
              viewBox="0 0 257 170"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlnsXlink="http://www.w3.org/1999/xlink"
            >
              <defs>
                <rect id="path-1" x="15.2694611" y="31.3090909" width="80.9281437" height="13.7454545" rx="4"></rect>
                <filter
                  x="-8.0%"
                  y="-40.0%"
                  width="116.1%"
                  height="194.6%"
                  filterUnits="objectBoundingBox"
                  id="filter-2"
                >
                  <feOffset dx="0" dy="1" in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>
                  <feGaussianBlur stdDeviation="2" in="shadowOffsetOuter1" result="shadowBlurOuter1"></feGaussianBlur>
                  <feColorMatrix
                    values="0 0 0 0 0.474977355   0 0 0 0 0.474977355   0 0 0 0 0.474977355  0 0 0 0.186680507 0"
                    type="matrix"
                    in="shadowBlurOuter1"
                  ></feColorMatrix>
                </filter>
                <filter id="filter-3">
                  <feColorMatrix
                    in="SourceGraphic"
                    type="matrix"
                    values="0 0 0 0 0.200000 0 0 0 0 0.200000 0 0 0 0 0.200000 0 0 0 1.000000 0"
                  ></feColorMatrix>
                </filter>
                <path
                  d="M82.9839771,47.3379487 L83.3590833,47.4112821 L85.8419285,48.5846154 C86.2587131,48.714359 86.5326001,49.1035897 86.4968757,49.5210256 L86.4968757,49.594359 L86.4968757,49.6676923 L85.9610098,53.12 C85.9252854,53.3625641 85.8121582,53.5882051 85.6037659,53.7461538 C85.4191899,53.9153846 85.1750732,54 84.9190484,54 L80.8226514,54 C80.5309022,54 80.2629693,53.8984615 80.0664851,53.7010256 L76.5,50.3333333 L77.0358659,49.7692308 C77.1787634,49.6282051 77.4050179,49.5492308 77.6193643,49.5605128 L77.7920322,49.5605128 L80.1557961,50.0512821 L80.1557961,44.1282051 C80.1557961,43.5051146 80.6889413,43 81.3466092,43 C82.0042771,43 82.5374222,43.5051146 82.5374222,44.1282051 L82.5374222,47.3379487 L82.9839771,47.3379487 Z"
                  id="path-4"
                ></path>
                <filter
                  x="-125.0%"
                  y="-104.5%"
                  width="350.0%"
                  height="327.3%"
                  filterUnits="objectBoundingBox"
                  id="filter-5"
                >
                  <feOffset dx="0" dy="1" in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>
                  <feGaussianBlur stdDeviation="4" in="shadowOffsetOuter1" result="shadowBlurOuter1"></feGaussianBlur>
                  <feColorMatrix
                    values="0 0 0 0 0   0 0 0 0 0   0 0 0 0 0  0 0 0 0.2 0"
                    type="matrix"
                    in="shadowBlurOuter1"
                    result="shadowMatrixOuter1"
                  ></feColorMatrix>
                  <feMorphology radius="1" operator="erode" in="SourceAlpha" result="shadowSpreadOuter2"></feMorphology>
                  <feOffset dx="0" dy="3" in="shadowSpreadOuter2" result="shadowOffsetOuter2"></feOffset>
                  <feGaussianBlur stdDeviation="1.5" in="shadowOffsetOuter2" result="shadowBlurOuter2"></feGaussianBlur>
                  <feColorMatrix
                    values="0 0 0 0 0   0 0 0 0 0   0 0 0 0 0  0 0 0 0.12 0"
                    type="matrix"
                    in="shadowBlurOuter2"
                    result="shadowMatrixOuter2"
                  ></feColorMatrix>
                  <feOffset dx="0" dy="3" in="SourceAlpha" result="shadowOffsetOuter3"></feOffset>
                  <feGaussianBlur stdDeviation="2" in="shadowOffsetOuter3" result="shadowBlurOuter3"></feGaussianBlur>
                  <feColorMatrix
                    values="0 0 0 0 0   0 0 0 0 0   0 0 0 0 0  0 0 0 0.14 0"
                    type="matrix"
                    in="shadowBlurOuter3"
                    result="shadowMatrixOuter3"
                  ></feColorMatrix>
                  <feMerge>
                    <feMergeNode in="shadowMatrixOuter1"></feMergeNode>
                    <feMergeNode in="shadowMatrixOuter2"></feMergeNode>
                    <feMergeNode in="shadowMatrixOuter3"></feMergeNode>
                  </feMerge>
                </filter>
              </defs>
              <g id="高级搜索" stroke="none" strokeWidth="1" fill="none" fillRule="evenodd">
                <g id="3---1" transform="translate(-859.000000, -328.000000)">
                  <g id="缺省" transform="translate(859.000000, 329.000000)">
                    <g id="browser" transform="translate(0.500000, 0.000000)">
                      <g id="1" transform="translate(0.500000, 0.000000)">
                        <rect
                          id="矩形"
                          stroke="#F6F6F6"
                          fill="#FFFFFF"
                          x="0.570965922"
                          y="0.472956938"
                          width="254.236527"
                          height="167.236364"
                          rx="8"
                        ></rect>
                        <g id="矩形">
                          <use fill="black" fillOpacity="1" filter="url(#filter-2)" xlinkHref="#path-1"></use>
                          <use fill="#FFFFFF" fillRule="evenodd" xlinkHref="#path-1"></use>
                        </g>
                        <path
                          d="M33.1267761,40.4727273 L34.027646,39.2350738 C34.1891227,39.0100459 34.3505994,38.7725164 34.5290736,38.4974823 L34.5630687,38.4974823 C34.7670392,38.7725164 34.9370147,39.0100459 35.0984913,39.2350738 L36.0163587,40.4727273 L36.8832335,40.4727273 L35.0644962,38.1349374 L36.7642507,35.8909091 L35.9398698,35.8909091 L35.1069901,37.059804 C34.9540122,37.2723304 34.8350294,37.4661044 34.6650539,37.728637 L34.6310588,37.728637 C34.4270883,37.4661044 34.2996067,37.2723304 34.13813,37.059804 L33.2882528,35.8909091 L32.421378,35.8909091 L34.1211325,38.1036835 L32.3023952,40.4727273 L33.1267761,40.4727273 Z M38.4710875,40.4727273 L39.3719574,39.2350738 C39.5334341,39.0100459 39.6949107,38.7725164 39.873385,38.4974823 L39.90738,38.4974823 C40.1113506,38.7725164 40.281326,39.0100459 40.4428027,39.2350738 L41.3606701,40.4727273 L42.2275449,40.4727273 L40.4088076,38.1349374 L42.1085621,35.8909091 L41.2841812,35.8909091 L40.4513015,37.059804 C40.2983236,37.2723304 40.1793408,37.4661044 40.0093653,37.728637 L39.9753702,37.728637 C39.7713997,37.4661044 39.6439181,37.2723304 39.4824414,37.059804 L38.6325642,35.8909091 L37.7656894,35.8909091 L39.4654439,38.1036835 L37.6467066,40.4727273 L38.4710875,40.4727273 Z"
                          id="XX"
                          fill="#666666"
                          fillRule="nonzero"
                        ></path>
                        <g id="编组" transform="translate(23.000000, 34.181818)" opacity="0.80203683">
                          <g filter="url(#filter-3)" id="icon/24x24/serch/n">
                            <g>
                              <rect
                                id="矩形"
                                fill="#000000"
                                fillRule="nonzero"
                                opacity="0"
                                x="0"
                                y="0"
                                width="8"
                                height="8"
                              ></rect>
                              <path
                                d="M3.22857143,1 C4.45942857,1 5.45714286,1.99771429 5.45714286,3.22857143 C5.45714286,3.78057143 5.25485714,4.288 4.92228571,4.67885714 L5.01485714,4.77142857 L5.28571429,4.77142857 L7,6.48571429 L6.48571429,7 L4.77142857,5.28571429 L4.77142857,5.01485714 L4.67885714,4.92228571 C4.288,5.25485714 3.78057143,5.45714286 3.22857143,5.45714286 C1.99771429,5.45714286 1,4.45942857 1,3.22857143 C1,1.99771429 1.99771429,1 3.22857143,1 M3.22857143,1.68571429 C2.37142857,1.68571429 1.68571429,2.37142857 1.68571429,3.22857143 C1.68571429,4.08571429 2.37142857,4.77142857 3.22857143,4.77142857 C4.08571429,4.77142857 4.77142857,4.08571429 4.77142857,3.22857143 C4.77142857,2.37142857 4.08571429,1.68571429 3.22857143,1.68571429 Z"
                                id="形状"
                                fill="#FFFFFF"
                              ></path>
                            </g>
                          </g>
                        </g>
                        <rect
                          id="矩形备份"
                          fill="#A4BCDB"
                          opacity="0.212476424"
                          x="15.0769539"
                          y="53.9275024"
                          width="46.5718563"
                          height="23.6727273"
                          rx="4"
                        ></rect>
                        <rect
                          id="矩形备份-6"
                          fill="#A4BCDB"
                          opacity="0.212476424"
                          x="15.0769539"
                          y="86.763866"
                          width="100.01497"
                          height="49.6363636"
                          rx="4"
                        ></rect>
                        <rect
                          id="矩形备份-7"
                          fill="#A4BCDB"
                          opacity="0.212476424"
                          x="15.0769539"
                          y="145.563866"
                          width="225.224551"
                          height="13.7454545"
                          rx="4"
                        ></rect>
                        <rect
                          id="矩形备份-3"
                          fill="#A4BCDB"
                          opacity="0.212476424"
                          x="67.7565947"
                          y="53.9275024"
                          width="47.3353293"
                          height="23.6727273"
                          rx="4"
                        ></rect>
                        <rect
                          id="矩形备份-5"
                          fill="#A4BCDB"
                          opacity="0.212476424"
                          x="121.392216"
                          y="54.2181818"
                          width="47.3353293"
                          height="23.6727273"
                          rx="4"
                        ></rect>
                        <rect
                          id="矩形备份-8"
                          fill="#A4BCDB"
                          opacity="0.212476424"
                          x="174.642822"
                          y="53.9275024"
                          width="47.3353293"
                          height="23.6727273"
                          rx="4"
                        ></rect>
                        <rect
                          id="矩形备份-10"
                          fill="#A4BCDB"
                          opacity="0.212476424"
                          x="228.085936"
                          y="53.9275024"
                          width="12.2155689"
                          height="23.6727273"
                          rx="4"
                        ></rect>
                        <g id="编组" transform="translate(121.392216, 87.054545)">
                          <path
                            d="M4,0 L111.284431,0 C113.49357,-4.05812251e-16 115.284431,1.790861 115.284431,4 L115.284431,45.6363636 C115.284431,47.8455026 113.49357,49.6363636 111.284431,49.6363636 L4,49.6363636 C1.790861,49.6363636 2.705415e-16,47.8455026 0,45.6363636 L0,4 C-2.705415e-16,1.790861 1.790861,4.05812251e-16 4,0 Z"
                            id="矩形"
                            fillOpacity="0.12"
                            fill="#D9E6F0"
                            opacity="0.357724144"
                          ></path>
                          <rect
                            id="矩形"
                            fill="#A4BCDB"
                            opacity="0.212476424"
                            x="7.44222341"
                            y="21.0911388"
                            width="9.9251497"
                            height="28.2545455"
                          ></rect>
                          <rect
                            id="矩形备份-11"
                            fill="#A4BCDB"
                            opacity="0.212476424"
                            x="25.7655767"
                            y="30.2547751"
                            width="9.9251497"
                            height="19.0909091"
                          ></rect>
                          <rect
                            id="矩形备份-12"
                            fill="#A4BCDB"
                            opacity="0.212476424"
                            x="44.852403"
                            y="21.0911388"
                            width="9.9251497"
                            height="28.2545455"
                          ></rect>
                          <rect
                            id="矩形备份-13"
                            fill="#A4BCDB"
                            opacity="0.212476424"
                            x="63.1757563"
                            y="16.5093206"
                            width="9.9251497"
                            height="32.8363636"
                          ></rect>
                          <rect
                            id="矩形备份-20"
                            fill="#A4BCDB"
                            opacity="0.212476424"
                            x="100.585936"
                            y="43.2365933"
                            width="9.9251497"
                            height="6.10909091"
                          ></rect>
                          <rect
                            id="矩形备份-14"
                            fill="#A4BCDB"
                            opacity="0.212476424"
                            x="82.2625827"
                            y="40.1820478"
                            width="9.9251497"
                            height="9.16363636"
                          ></rect>
                        </g>
                      </g>
                      <path
                        d="M255.5,6.80973025 L255.5,22 L0.5,22 L0.5,6.80973025 C0.5,3.60105973 3.16223203,1 6.44636477,1 L249.552945,1 C252.837768,1 255.5,3.60105973 255.5,6.80973025 Z"
                        id="Path"
                        fill="#4F709B"
                        fillRule="nonzero"
                        opacity="0.334728423"
                      ></path>
                      <g id="路径">
                        <use fill="black" fillOpacity="1" filter="url(#filter-5)" xlinkHref="#path-4"></use>
                        <use fill="#FFFFFF" fillRule="evenodd" xlinkHref="#path-4"></use>
                      </g>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
          </Box>
          <Box height={16} />
          <Typography noWrap className={classes.tip} align="center">
            请尝试输入任意关键词开始自定义赛道
          </Typography>
          <Box height={24} />
          <Box
            margin="auto"
            maxWidth={1315 + 48}
            display="grid"
            gridTemplateColumns="1fr max-content 1fr"
            gridColumnGap="8px"
            alignItems="center"
          >
            <Box
              width={1}
              height="1px"
              style={{ background: "linear-gradient(to right, rgb(255, 255, 255,0), rgb(182, 182, 182,0.5))" }}
            />
            <Typography noWrap className={classes.tip} align="center" style={{ fontWeight: 400 }}>
              或
            </Typography>
            <Box
              width={1}
              height="1px"
              style={{
                background: "linear-gradient(to left, rgb(255, 255, 255,0), rgb(182, 182, 182,0.5))",
              }}
            />
          </Box>
          <Box height={24} />
          <Typography noWrap className={classes.tip} align="center">
            点击查看近期热门搜索
          </Typography>
        </Box>
        <Box height={24} />
      </Box>
      <Box padding="0 24px" paddingBottom="24px">
        <Box display="flex" alignItems="center">
          <Eye fontSize="small" style={{ color: "#666" }} />
          <Box width={4} />
          <Typography noWrap className={classes.tip} style={{ color: "#666" }}>
            大家都在看
          </Typography>
        </Box>
        <Box height={16} />
        <Box display="grid" gridGap="24px" gridTemplateColumns="repeat(auto-fill,minmax(311px,1fr))">
          {presetTemplates.map((t, i) => (
            <TemplateCard
              key={i}
              template={t}
              onClick={() => {
                setTitle(t.title);
                updateConditions((t?.conditions as NextSearchConditionInput[]) ?? []);
              }}
            />
          ))}
        </Box>
      </Box>
    </>
  );
};

export default PresetTemplates;
