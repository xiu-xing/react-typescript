import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useState } from "react";
import SwiperCore, { A11y, Autoplay } from "swiper";
import { Swiper, SwiperSlide } from "swiper/react";
import { PropagandaWebP1, PropagandaWebP2, PropagandaWebP3, PropagandaWebP4, PropagandaWebP5 } from "../assets";

SwiperCore.use([A11y, Autoplay]);
const SwiperImageWidth = 192;

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    swiperImg: {
      width: SwiperImageWidth,
    },
  }),
);

const SwiperDisplay: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const [currentIndex, setCurrentIndex] = useState(0);

  const swiperConifg = [
    {
      link: PropagandaWebP1,
    },
    {
      link: PropagandaWebP2,
    },
    {
      link: PropagandaWebP3,
    },
    {
      link: PropagandaWebP4,
    },
    {
      link: PropagandaWebP5,
    },
  ];

  const screenWidth = process.browser ? window.screen.availWidth : 0;

  return (
    <Swiper
      slidesPerView={screenWidth > 0 ? Math.min(screenWidth / SwiperImageWidth, swiperConifg.length) : 1.5}
      onSlideChange={(swiper): void => setCurrentIndex(swiper.realIndex)}
      loop={true}
      autoplay={{
        delay: 2500,
        disableOnInteraction: false,
      }}
      centeredSlides={true}
    >
      {swiperConifg.map((item, index) => {
        return (
          <SwiperSlide
            key={index}
            style={{
              transform: `scale(${currentIndex === index ? 1 : 0.8})`,
              textAlign: "center",
            }}
          >
            <img className={classes.swiperImg} src={item.link} />
          </SwiperSlide>
        );
      })}
    </Swiper>
  );
};

export default SwiperDisplay;
