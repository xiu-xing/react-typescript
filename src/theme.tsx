import { createTheme } from "@material-ui/core/styles";

const theme = createTheme({
  palette: {
    primary: {
      main: "#4F709B",
    },
    secondary: {
      main: "#2B8AE7",
    },
    error: {
      main: "#DC004E",
    },
    background: {
      default: "#fff",
    },
    grey: {
      "500": "#999",
      "600": "#666",
      "800": "#333",
    },
  },
  typography: {
    fontWeightRegular: 400,
    fontWeightMedium: 500,
    fontSize:16,
    fontFamily: "Noto Sans SC, YouSheBiaoTiHei",
  },
  overrides: {
    // Style sheet name ⚛️
    MuiButton: {
      // Name of the rule
      text: {
        // Some CSS
        background: 'linear-gradient(45deg, #FE6B8B 30%, #FF8E53 90%)',
        borderRadius: 3,
        border: 0,
        color: 'white',
        height: 48,
        padding: '0 30px',
        boxShadow: '0 3px 5px 2px rgba(255, 105, 135, .3)',
      },
    },
  },
  spacing:4,
  breakpoints: {
    values: {
      xs: 600,
      sm: 750,
      md: 960,
      lg: 1200,
      xl: 1920,
    },
  },
});

export default theme;
