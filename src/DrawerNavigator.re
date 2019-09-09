type contentComponentProps('screenProps) = {
  .
  "navigation": Navigation.t,
  "screenProps": 'screenProps,
};

type contentComponent('screenProps) =
  React.component(contentComponentProps('screenProps));

[@bs.module "react-navigation"]
external drawerItems: contentComponent('screenProps) = "DrawerItems";

type contentOptions;

[@bs.obj]
external contentOptions:
  (
    ~activeTintColor: string=?,
    ~activeBackgroundColor: string=?,
    ~inactiveTintColor: string=?,
    ~inactiveBackgroundColor: string=?,
    ~itemsContainerStyle: ReactNative.Style.t=?,
    ~itemStyle: ReactNative.Style.t=?,
    ~labelStyle: ReactNative.Style.t=?,
    ~activeLabelStyle: ReactNative.Style.t=?,
    ~inactiveLabelStyle: ReactNative.Style.t=?,
    ~iconContainerStyle: ReactNative.Style.t=?,
    // TODO: more props
    unit
  ) =>
  contentOptions =
  "";

type config;

[@bs.obj]
external config:
  (
    ~mode: [@bs.string] [ | `card | `modal]=?,
    ~drawerWidth: float=?,
    ~drawerPosition: [@bs.string] [ | `left | `right]=?,
    ~contentComponent: contentComponent('screenProps)=?,
    ~contentOptions: contentOptions=?,
    ~useNativeAnimations: bool=?,
    ~drawerBackgroundColor: string=?,
    ~initialRouteName: string=?,
    ~backBehavior: [@bs.string] [ | `initialRoute | `none]=?,
    ~hideStatusBar: bool=?,
    // TODO: more props
    unit
  ) =>
  config =
  "";

[@bs.module "react-navigation"]
external make: Js.t('a) => Navigator.t = "createDrawerNavigator";

[@bs.module "react-navigation"]
external makeWithConfig: (Js.t('a), config) => Navigator.t =
  "createDrawerNavigator";
