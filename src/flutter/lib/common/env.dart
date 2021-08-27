const IS_DEV = false;

const DOMAIN = IS_DEV ? "180.96.8.140" : "rimedata.com";

const ENDPOINT =
    IS_DEV ? "http://180.96.8.140:9998/v2" : "https://rimedata.com:9998/v2";

// const ENDPOINT = "http://106.52.195.47:8097";

const WEB_ENDPOINT = IS_DEV ? "http://180.96.8.140" : "https://rimedata.com";
const GRAPHQL_ENDPOINT = "$ENDPOINT/graphql";

const STAIC_ASSETS_ENDPOINT = IS_DEV
    ? "http://180.96.8.140:9998/resource/get/"
    : "https://rimedata.com:9998/resource/get/";

const MUSE_ENDPOINT = IS_DEV
    ? "http://192.168.88.11:1126/muse"
    : "https://rimedata.com:9998/muse";
const SHARE_LINK = "$WEB_ENDPOINT/mobile/share?";
const APP_DOWNLOAD_LINK = "$WEB_ENDPOINT/mobile/download";
const CHECK_UPDATE_ENDPOINT = "https://rimedata.com:9998/version-manager";
const CHECK_UPDATE_APP_ID = "d9287f52-9dc9-4346-8f7d-bc28f74a70db";
const CHECK_UPDATE_TOKEN = "4a3xyuiied3zz369fp0fognglnp47lg9";
const STORAGE_ENDPOINT = "$WEB_ENDPOINT/resource/api";
const STATIC_FILE_PATH = "$ENDPOINT/static";
const APPLE_APP_ID = "1542948819";
const CUSTOMER_DATA_URL =
    "https://rimedata.com:9998/v2/resource/get/wechat_customer.json";
const MUSE_APP_ID = "7b3d24e3-4ccd-4e16-984b-9fab033f1802";

const RISK_TAG_CONFIG = "risk_tag_config.json";
const RISK_EVENT_CONFIG = "risk_event_config.json";
const ENTITY_TAG_CONFIG = "entity_tag_config.json";
const REALM_CONDITION_CONFIG = "mobile_realm_condition_config.json";

const USER_AGENT =
    "Mozilla/5.0 (Linux; Android 4.1.1; Galaxy Nexus Build/JRO03C) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19";
