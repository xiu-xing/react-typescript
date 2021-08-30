import React from "react";
import { Box } from "@material-ui/core"

const Debounce: React.FunctionComponent<{}> = () => {
  //处理滚动防抖
  function debounce(callback: Function, waitTime: number, immade: boolean) {
    var timer: any = null;
    return function (this: any, ...args: any) {
      clearTimeout(timer);
      var that = this;
      if (immade) {
        var isNow = !timer;
        timer = setTimeout(function () {
          timer = "";
        }, waitTime)
        if (isNow) {
          callback.apply(that, args)
        }
      } else {
        timer = setTimeout(function () {
          callback.apply(that, args);
        }, waitTime)
      }
    }
  }

  //处理节流
  function throttle(callback: Function, waitTime: number = 500) {
    var flag = true;
    return function (this: any, ...args: any) {
      if (flag) {
        callback.apply(this, args);
        flag = false;
        setTimeout(() => {
          flag = true;
        }, waitTime)
      }
    }
  }
  return (
    <Box>Debounce</Box>
  )
}

export default Debounce;