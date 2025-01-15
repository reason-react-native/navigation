open ReactNative

module Header = {
  type headerTitleProps = {
    allowFontScaling?: bool,
    tintColor?: Color.t,
    style?: Style.t,
    children: string,
  }

  @unboxed
  type headerTitle =
    | String(string)
    | Function(headerTitleProps => React.element)

  type displayMode = [#default | #generic | #minimal]

  type headerButtonCommonProps = {
    tintColor?: Color.t,
    pressColor?: Color.t,
    pressOpacity?: float,
  }

  type headerRightProps = {
    ...headerButtonCommonProps,
    canGoBack?: bool,
  }
  type headerLeftProps = {
    ...headerRightProps,
    displayMode?: displayMode,
    href?: string,
  }

  type headerBackgroundOptions = {style?: Style.t}

  type headerTitleAlign = [#left | #center]

  type inputType = [
    | #text
    | #phone
    | #number
    | #email
  ]

  type headerSearchBarOptions = {
    ref?: TextInputElement.ref,
    autoCapitalize?: TextInput.autoCapitalize,
    autoFocus?: bool,
    cancelButtonText?: string,
    inputType?: inputType,
    onBlur?: Event.targetEvent => unit,
    onChangeText?: string => unit,
    onClose?: unit => unit,
    onFocus?: Event.targetEvent => unit,
    placeholder?: string,
  }

  type headerOptions = {
    headerTitle?: headerTitle,
    headerTitleAlign?: headerTitleAlign,
    headerTitleAllowFontScaling?: bool,
    headerTitleStyle?: Style.t,
    headerTitleContainerStyle?: Style.t,
    headerLeft?: headerLeftProps => React.element,
    headerLeftContainerStyle?: Style.t,
    headerRight?: headerRightProps => React.element,
    headerRightContainerStyle?: Style.t,
    headerSearchBarOptions?: headerSearchBarOptions,
    headerPressColor?: Color.t,
    headerPressOpacity?: float,
    headerTintColor?: Color.t,
    headerBackground?: headerBackgroundOptions => React.element,
    headerBackgroundContainerStyle?: Style.t,
    headerTransparent?: bool,
    headerStyle?: Style.t,
    headerShadowVisible?: bool,
    headerStatusBarHeight?: Style.size,
  }

  type backProp = {
    title?: string,
    href?: string,
  }

  type props = {
    ...headerOptions,
    backProp?: backProp,
    modal?: bool,
    layout?: Core.layout,
    title: string,
  }

  @module("@react-navigation/elements")
  external make: React.component<props> = "Header"
}

module HeaderBackground = {
  @module("@react-navigation/elements")
  external make: React.component<View.props> = "HeaderBackground"
}

module HeaderTitle = {
  @module("@react-navigation/elements")
  external make: React.component<Text.props> = "HeaderTitle"
}

module HeaderButton = {
  type headerButtonProps = {
    ...Header.headerButtonCommonProps,
    onPress?: unit => unit,
    href?: string,
    disabled?: bool,
    accessibilityLabel?: string,
    testID?: string,
    style?: Style.t,
  }

  type props = {
    ...headerButtonProps,
    children: React.element,
  }

  @module("@react-navigation/elements")
  external make: React.component<props> = "HeaderTitle"
}

module HeaderBackButton = {
  type backImageProps = {tintColor?: Color.t}

  type props = {
    ...HeaderButton.headerButtonProps,
    backImage?: backImageProps => React.element,
    label?: string,
    truncatedLabel?: string,
    displayMode?: Header.displayMode,
    labelStyle?: Style.t,
    allowFontScaling?: bool,
    onLabelLayout?: Event.layoutEvent => unit,
    screenLayout?: Core.layout,
    titleLayout?: Core.layout,
  }

  @module("@react-navigation/elements")
  external make: React.component<props> = "HeaderBackButton"
}

@module("@react-navigation/elements")
external useHeaderHeight: unit => float = "useHeaderHeight"
