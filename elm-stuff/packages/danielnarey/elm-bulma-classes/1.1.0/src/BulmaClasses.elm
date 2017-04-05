module BulmaClasses exposing
  ( element, content, image, heading, icon, control, button, delete, input
  , textarea, checkbox, radio, select, label, help, notification, progress, tag
  , number, section, footer, nav, hero, level, feature, columns, tile, table
  , menu, tabs, panel, pagination, card, media, message, modal
  )

{-|

## Bulma CSS classes organized into nested record sets

- [Modifiers that can be applied to any element](#modifiers-that-can-be-applied-to-any-element)
- [Element classes and modifiers](#element-classes-and-modifiers)
  + [Text, images, and icons](#text-images-and-icons)
  + [UI elements](#ui-elements)
    * [Control](#control)
    * [Buttons](#buttons)
    * [Form elements](#form-elements)
    * [Indicators](#indicators)
- [Component classes and modifiers](#component-classes-and-modifiers)
  + [Page layout](#page-layout)
  + [Section layout](#section-layout)
  + [Navigation/controls UI](#navigation-controls-ui)
  + [Content/media UI](#content-media-ui)


# Modifiers that can be applied to any element
@docs element

# Element classes and modifiers

## Text, images, and icons
@docs content, image, heading, icon

## UI elements

### Control
@docs control

### Buttons
@docs button, delete

### Form elements
@docs input, textarea, checkbox, radio, select, label, help

### Indicators
@docs notification, progress, tag, number

# Component classes and modifiers

## Page layout
@docs section, footer, nav, hero, level

## Section layout
@docs feature, columns, tile, table

## Navigation/controls UI
@docs menu, tabs, panel, pagination

## Content/media UI
@docs card, media, message, modal

-}

import Internal.RecordTypes exposing (..)

-- Modifiers that can be applied to any element

{-| *Bulma is simply a collection of CSS classes.* The following are modifier
classes that can be applied to any element.

Docs: http://bulma.io/documentation/overview/classes/

__Box style class ([docs](http://bulma.io/documentation/elements/box/)):__

    element.style.box --> "box"

__Float modifiers ([docs](http://bulma.io/documentation/modifiers/helpers/)):__

    element.float.isClearfix --> "is-clearfix"
    element.float.isPulledLeft --> "is-pulled-left"
    element.float.isPulledRight --> "is-pulled-right"

__Text alignment modifiers ([docs](http://bulma.io/documentation/modifiers/helpers/)):__

    element.alignment.hasTextCentered --> "has-text-centered"
    element.alignment.hasTextLeft --> "has-text-left"
    element.alignment.hasTextRight --> "has-text-right"

__Element sizing modifiers ([docs](http://bulma.io/documentation/modifiers/helpers/)):__

    element.sizing.isOverlay --> "is-overlay"
    element.sizing.isFullwidth --> "is-fullwidth"
    element.sizing.isMarginless --> "is-marginless"
    element.sizing.isPaddingless --> "is-paddingless"

__Display modifiers with responsive classes ([docs](http://bulma.io/documentation/modifiers/responsive-helpers/)):__

    element.display.isBlock.always --> "is-block-touch is-block-desktop"
    element.display.isBlock.mobile --> "is-block-mobile"
    element.display.isBlock.tablet --> "is-block-tablet"
    element.display.isBlock.tabletOnly --> "is-block-tablet-only"
    element.display.isBlock.touch --> "is-block-touch"
    element.display.isBlock.desktop --> "is-block-desktop"
    element.display.isBlock.desktopOnly --> "is-block-desktop-only"
    element.display.isBlock.widescreen -->"is-block-widescreen"

    element.display.isFlex.always --> "is-flex-touch is-flex-desktop"
    element.display.isFlex.mobile --> "is-flex-mobile"
    element.display.isFlex.tablet --> "is-flex-tablet"
    element.display.isFlex.tabletOnly --> "is-flex-tablet-only"
    element.display.isFlex.touch --> "is-flex-touch"
    element.display.isFlex.desktop --> "is-flex-desktop"
    element.display.isFlex.desktopOnly --> "is-flex-desktop-only"
    element.display.isFlex.widescreen -->"is-flex-widescreen"

    element.display.isInline.always --> "is-inline-touch is-inline-desktop"
    element.display.isInline.mobile --> "is-inline-mobile"
    element.display.isInline.tablet --> "is-inline-tablet"
    element.display.isInline.tabletOnly --> "is-inline-tablet-only"
    element.display.isInline.touch --> "is-inline-touch"
    element.display.isInline.desktop --> "is-inline-desktop"
    element.display.isInline.desktopOnly --> "is-inline-desktop-only"
    element.display.isInline.widescreen -->"is-inline-widescreen"

    element.display.isInlineBlock.always --> ""is-inline-block-touch is-inline-block-desktop"
    element.display.isInlineBlock.mobile --> "is-inline-block-mobile"
    element.display.isInlineBlock.tablet --> "is-inline-block-tablet"
    element.display.isInlineBlock.tabletOnly --> "is-inline-block-tablet-only"
    element.display.isInlineBlock.touch --> "is-inline-block-touch"
    element.display.isInlineBlock.desktop --> "is-inline-block-desktop"
    element.display.isInlineBlock.desktopOnly --> "is-inline-block-desktop-only"
    element.display.isInlineBlock.widescreen -->"is-inline-block-widescreen"

    element.display.isInlineFlex.always --> "is-inline-flex-touch is-inline-flex-desktop"
    element.display.isInlineFlex.mobile --> "is-inline-flex-mobile"
    element.display.isInlineFlex.tablet --> "is-inline-flex-tablet"
    element.display.isInlineFlex.tabletOnly --> "is-inline-flex-tablet-only"
    element.display.isInlineFlex.touch --> "is-inline-flex-touch"
    element.display.isInlineFlex.desktop --> "is-inline-flex-desktop"
    element.display.isInlineFlex.desktopOnly --> "is-inline-flex-desktop-only"
    element.display.isInlineFlex.widescreen --> "is-inline-flex-widescreen"

__Visibility modifier with responsive classes ([docs](http://bulma.io/documentation/modifiers/responsive-helpers/)):__

    element.visability.isHidden.always --> "is-hidden"
    element.visability.isHidden.mobile --> "is-hidden-mobile"
    element.visability.isHidden.tablet --> "is-hidden-tablet"
    element.visability.isHidden.tabletOnly -->"is-hidden-tablet-only"
    element.visability.isHidden.touch --> "is-hidden-touch"
    element.visability.isHidden.desktop --> "is-hidden-desktop"
    element.visability.isHidden.desktopOnly --> "is-hidden-desktop-only"
    element.visability.isHidden.widescreen --> "is-hidden-widescreen"

__Interaction modifier ([docs](http://bulma.io/documentation/modifiers/helpers/)):__

    element.interaction.isUnselectable --> "is-unselectable"

-}
element : Element
element =
  { style =
    { box = "box"
    }
  , float =
    { isClearfix = "is-clearfix"
    , isPulledLeft = "is-pulled-left"
    , isPulledRight = "is-pulled-right"
    }
  , alignment =
    { hasTextCentered = "has-text-centered"
    , hasTextLeft = "has-text-left"
    , hasTextRight = "has-text-right"
    }
  , sizing =
    { isOverlay = "is-overlay"
    , isFullwidth = "is-fullwidth"
    , isMarginless = "is-marginless"
    , isPaddingless = "is-paddingless"
    }
  , display =
    { isBlock =
      { always = "is-block-touch is-block-desktop"
      , mobile = "is-block-mobile"
      , tablet = "is-block-tablet"
      , tabletOnly = "is-block-tablet-only"
      , touch = "is-block-touch"
      , desktop = "is-block-desktop"
      , desktopOnly = "is-block-desktop-only"
      , widescreen = "is-block-widescreen"
      }
    , isFlex =
      { always = "is-flex-touch is-flex-desktop"
      , mobile = "is-flex-mobile"
      , tablet = "is-flex-tablet"
      , tabletOnly = "is-flex-tablet-only"
      , touch = "is-flex-touch"
      , desktop = "is-flex-desktop"
      , desktopOnly = "is-flex-desktop-only"
      , widescreen = "is-flex-widescreen"
      }
    , isInline =
      { always = "is-inline-touch is-inline-desktop"
      , mobile = "is-inline-mobile"
      , tablet = "is-inline-tablet"
      , tabletOnly = "is-inline-tablet-only"
      , touch = "is-inline-touch"
      , desktop = "is-inline-desktop"
      , desktopOnly = "is-inline-desktop-only"
      , widescreen = "is-inline-widescreen"
      }
    , isInlineBlock =
      { always = "is-inline-block-touch is-inline-block-desktop"
      , mobile = "is-inline-block-mobile"
      , tablet = "is-inline-block-tablet"
      , tabletOnly = "is-inline-block-tablet-only"
      , touch = "is-inline-block-touch"
      , desktop = "is-inline-block-desktop"
      , desktopOnly = "is-inline-block-desktop-only"
      , widescreen = "is-inline-block-widescreen"
      }
    , isInlineFlex =
      { always = "is-inline-flex-touch is-inline-flex-desktop"
      , mobile = "is-inline-flex-mobile"
      , tablet = "is-inline-flex-tablet"
      , tabletOnly = "is-inline-flex-tablet-only"
      , touch = "is-inline-flex-touch"
      , desktop = "is-inline-flex-desktop"
      , desktopOnly = "is-inline-flex-desktop-only"
      , widescreen = "is-inline-flex-widescreen"
      }
    }
  , visibility =
    { isHidden =
      { always = "is-hidden"
      , mobile = "is-hidden-mobile"
      , tablet = "is-hidden-tablet"
      , tabletOnly = "is-hidden-tablet-only"
      , touch = "is-hidden-touch"
      , desktop = "is-hidden-desktop"
      , desktopOnly = "is-hidden-desktop-only"
      , widescreen = "is-hidden-widescreen"
      }
    }
  , interaction =
    { isUnselectable = "is-unselectable"
    }
  }


-- Wrappers and modifiers for content and images

{-| *A single class to handle WYSIWYG generated content, where only HTML tags are
available.*

Docs: http://bulma.io/documentation/elements/content/

__Content wrapper:__

    content.container --> "content"

__Size modifiers:__

    content.size.isSmall --> "is-small"
    content.size.isMedium --> "is-medium"
    content.size.isLarge --> "is-large"

-}
content : Content
content =
  { container = "content"
  , size =
    { isSmall = "is-small"
    , isMedium = "is-medium"
    , isLarge = "is-large"
    }
  }

{-| *A container for responsive images.*

Docs: http://bulma.io/documentation/elements/image/

__Image wrapper:__

    image.container --> "image"

__Size modifiers:__

    image.size.is16X16 --> "is-16x16"
    image.size.is24x24 --> "is-24x24"
    image.size.is32x32 --> "is-32x32"
    image.size.is48x48 --> "is-48x48"
    image.size.is64x64 --> "is-64x64"
    image.size.is96x96 --> "is-96x96"
    image.size.is128x128 --> "is-128x128"
    image.size.isSquare --> "is-square"
    image.size.is1by1 --> "is-1by1"
    image.size.is4by3 --> "is-4by3"
    image.size.is3by2 --> "is-3by2"
    image.size.is16by9 --> "is-16by9"
    image.size.is2by1 --> "is-2by1"

-}
image : Image
image =
  { container = "image"
  , size =
    { is16X16 = "is-16x16"
    , is24x24 = "is-24x24"
    , is32x32 = "is-32x32"
    , is48x48 = "is-48x48"
    , is64x64 = "is-64x64"
    , is96x96 = "is-96x96"
    , is128x128 = "is-128x128"
    , isSquare = "is-square"
    , is1by1 = "is-1by1"
    , is4by3 = "is-4by3"
    , is3by2 = "is-3by2"
    , is16by9 = "is-16by9"
    , is2by1 = "is-2by1"
    }
  }

-- Classes and modifiers for special text

{-| *Simple headings to add depth to your page.*

Docs: http://bulma.io/documentation/elements/title/

__Text styling classes:__

    heading.title --> "title"
    heading.subtitle --> "subtitle"

__Size modifiers:__

    heading.size.isSmall --> "is-small"
    heading.size.isMedium --> "is-medium"
    heading.size.isLarge --> "is-large"

-}
heading : Heading
heading =
  { title = "title"
  , subtitle = "subtitle"
  , size =
    { is1 = "is-1"
    , is2 = "is-2"
    , is3 = "is-3"
    , is4 = "is-4"
    , is5 = "is-5"
    , is6 = "is-6"
    }
  }

{-| Wrapper for Font Awesome icons.

Docs: http://bulma.io/documentation/elements/icon/

__Icon wrapper:__

    icon.container --> "icon"

__Size modifiers:__

    icon.size.isSmall --> "is-small"
    icon.size.isMedium --> "is-medium"
    icon.size.isLarge --> "is-large"

-}
icon : Icon
icon =
  { container = "icon"
  , size =
    { isSmall = "is-small"
    , isMedium = "is-medium"
    , isLarge = "is-large"
    }
  }


-- UI elements

-- Control

{-| *When combining several controls in a form, use the control class to keep
the spacing consistent.*

Docs: http://bulma.io/documentation/elements/form/

__Control wrapper:__

    control.container --> "control"

__Control label:__

    control.label --> "control-label"

__Grouping buttons or form elements:__

    control.isGrouped.left --> "is-grouped"
    control.isGrouped.centered --> "is-grouped is-grouped-centered"
    control.isGrouped.right --> "is-grouped is-grouped-right"

__Attaching buttons or form elements inline:__

    control.hasAddons.left --> "has-addons"
    control.hasAddons.centered --> "has-addons has-addons-centered"
    control.hasAddons.right --> "has-addons has-addons-right"

__Displaying an icon inside a form element:__

    control.hasIcon.left --> "has-icon"
    control.hasIcon.right --> "has-icon has-icon-right"

__Layout modifier:__

    control.layout.isHorizontal --> "is-horizontal"

__State modifier:__

    control.state.isLoading --> "is-loading"

__Control addon modifier:__

    control.addon.isExpanded --> "is-expanded"

-}
control : Control
control =
  { container = "control"
  , label = "control-label"
  , isGrouped =
    { left = "is-grouped"
    , centered = "is-grouped is-grouped-centered"
    , right = "is-grouped is-grouped-right"
    }
  , hasAddons =
    { left = "has-addons"
    , centered = "has-addons has-addons-centered"
    , right = "has-addons has-addons-right"
    }
  , hasIcon =
    { left = "has-icon"
    , right = "has-icon has-icon-right"
    }
  , layout =
    { isHorizontal = "is-horizontal"
    }
  , state =
    { isLoading = "is-loading"
    }
  , addon =
    { isExpanded = "is-expanded"
    }
  }

--Buttons

{-| *The classic button, in different colors, sizes, and states.*

Docs: http://bulma.io/documentation/elements/button/

__Button UI element:__

    button.ui --> "button"

__Style modifiers:__

    button.style.isLink --> "is-link"
    button.style.isOutlined --> "is-outlined"
    button.style.isInverted --> "is-inverted"

__Size modifiers:__

    button.size.isSmall --> "is-small"
    button.size.isMedium --> "is-medium"
    button.size.isLarge --> "is-large"

__State modifiers:__

    button.state.isHovered --> "is-hovered"
    button.state.isFocused --> "is-focused"
    button.state.isActive --> "is-active"
    button.state.isLoading --> "is-loading"
    button.state.isDisabled --> "is-disabled"

__Color modifiers:__

    button.color.isPrimary --> "is-primary"
    button.color.isInfo --> "is-info"
    button.color.isSuccess --> "is-success"
    button.color.isWarning --> "is-warning"
    button.color.isDanger --> "is-danger"
    button.color.isWhite --> "is-white"
    button.color.isLight --> "is-light"
    button.color.isDark --> "is-dark"
    button.color.isBlack --> "is-black"

__Addon button modifier:__

    button.addon.isExpanded --> "is-expanded"

-}
button : Button
button =
  { ui = "button"
  , style =
    { isLink = "is-link"
    , isOutlined = "is-outlined"
    , isInverted = "is-inverted"
    }
  , size =
    { isSmall = "is-small"
    , isMedium = "is-medium"
    , isLarge = "is-large"
    }
  , state =
    { isHovered = "is-hovered"
    , isFocused = "is-focused"
    , isActive = "is-active"
    , isLoading = "is-loading"
    , isDisabled = "is-disabled"
    }
  , color =
    { isPrimary = "is-primary"
    , isInfo = "is-info"
    , isSuccess = "is-success"
    , isWarning = "is-warning"
    , isDanger = "is-danger"
    , isWhite = "is-white"
    , isLight = "is-light"
    , isDark = "is-dark"
    , isBlack = "is-black"
    }
  , addon =
    { isExpanded = "is-expanded"
    }
  }

{-| *A versatile delete cross.*

Docs: http://bulma.io/documentation/elements/delete/

__Delete UI element:__

    delete.ui --> "delete"

__Size modifiers:__

    delete.size.isSmall --> "is-small"
    delete.size.isMedium --> "is-medium"
    delete.size.isLarge --> "is-large"

-}
delete : Delete
delete =
  { ui = "delete"
  , size =
    { isSmall = "is-small"
    , isMedium = "is-medium"
    , isLarge = "is-large"
    }
  }


-- Form elements

{-| Docs: http://bulma.io/documentation/elements/form/

__Input UI element:__

    input.ui --> "input"

__Display modifier:__

    input.display.isInline --> "is-inline"

__Size modifiers:__

    input.size.isSmall --> "is-small"
    input.size.isMedium --> "is-medium"
    input.size.isLarge --> "is-large"

__State modifiers:__

    input.state.isHovered --> "is-hovered"
    input.state.isFocused --> "is-focused"
    input.state.isActive --> "is-active"
    input.state.isLoading --> "is-loading"
    input.state.isDisabled --> "is-disabled"

__Color modifiers:__

    input.color.isPrimary --> "is-primary"
    input.color.isInfo --> "is-info"
    input.color.isSuccess --> "is-success"
    input.color.isWarning --> "is-warning"
    input.color.isDanger --> "is-danger"
    input.color.isWhite --> "is-white"
    input.color.isLight --> "is-light"
    input.color.isDark --> "is-dark"
    input.color.isBlack --> "is-black"

__Addon input modifier:__

    input.addon.isExpanded --> "is-expanded"
-}
input : Input
input =
  { ui = "input"
  , display =
    { isInline = "is-inline"
    }
  , size =
    { isSmall = "is-small"
    , isMedium = "is-medium"
    , isLarge = "is-large"
    , isFullwidth = "is-fullwidth"
    }
  , state =
    { isHovered = "is-hovered"
    , isFocused = "is-focused"
    , isActive = "is-active"
    , isLoading = "is-loading"
    , isDisabled = "is-disabled"
    }
  , color =
    { isPrimary = "is-primary"
    , isInfo = "is-info"
    , isSuccess = "is-success"
    , isWarning = "is-warning"
    , isDanger = "is-danger"
    , isWhite = "is-white"
    , isLight = "is-light"
    , isDark = "is-dark"
    , isBlack = "is-black"
    }
  , addon =
    { isExpanded = "is-expanded"
    }
  }

{-| Docs: http://bulma.io/documentation/elements/form/

__Textarea UI element:__

    textarea.ui --> "textarea"

__Display modifier:__

    textarea.display.isInline --> "is-inline"

__Size modifiers:__

    textarea.size.isSmall --> "is-small"
    textarea.size.isMedium --> "is-medium"
    textarea.size.isLarge --> "is-large"

__State modifiers:__

    textarea.state.isHovered --> "is-hovered"
    textarea.state.isFocused --> "is-focused"
    textarea.state.isActive --> "is-active"
    textarea.state.isLoading --> "is-loading"
    textarea.state.isDisabled --> "is-disabled"

__Color modifiers:__

    textarea.color.isPrimary --> "is-primary"
    textarea.color.isInfo --> "is-info"
    textarea.color.isSuccess --> "is-success"
    textarea.color.isWarning --> "is-warning"
    textarea.color.isDanger --> "is-danger"
    textarea.color.isWhite --> "is-white"
    textarea.color.isLight --> "is-light"
    textarea.color.isDark --> "is-dark"
    textarea.color.isBlack --> "is-black"
-}
textarea : Textarea
textarea =
  { ui = "textarea"
  , display =
    { isInline = "is-inline"
    }
  , size =
    { isSmall = "is-small"
    , isMedium = "is-medium"
    , isLarge = "is-large"
    , isFullwidth = "is-fullwidth"
    }
  , state =
    { isHovered = "is-hovered"
    , isFocused = "is-focused"
    , isActive = "is-active"
    , isLoading = "is-loading"
    , isDisabled = "is-disabled"
    }
  , color =
    { isPrimary = "is-primary"
    , isInfo = "is-info"
    , isSuccess = "is-success"
    , isWarning = "is-warning"
    , isDanger = "is-danger"
    , isWhite = "is-white"
    , isLight = "is-light"
    , isDark = "is-dark"
    , isBlack = "is-black"
    }
  }

{-| Docs: http://bulma.io/documentation/elements/form/

__Checkbox UI element:__

    checkbox.ui --> "checkbox"

__State modifier:__

    checkbox.state.isDisabled --> "is-disabled"

-}
checkbox : Checkbox
checkbox =
  { ui = "checkbox"
  , state =
    { isDisabled = "is-disabled"
    }
  }

{-| Docs: http://bulma.io/documentation/elements/form/

__Radio UI element:__

    radio.ui --> "radio"

__State modifier:__

    radio.state.isDisabled --> "is-disabled"

-}
radio : Radio
radio =
  { ui = "radio"
  , state =
    { isDisabled = "is-disabled"
    }
  }

{-| Docs: http://bulma.io/documentation/elements/form/

__Select UI element:__

    select.ui --> "select"

__Size modifiers:__

    select.size.isSmall --> "is-small"
    select.size.isMedium --> "is-medium"
    select.size.isLarge --> "is-large"

__State modifiers:__

    select.state.isHovered --> "is-hovered"
    select.state.isFocused --> "is-focused"
    select.state.isActive --> "is-active"
    select.state.isLoading --> "is-loading"
    select.state.isDisabled --> "is-disabled"

__Addon select modifier:__

    select.addon.isExpanded --> "is-expanded"

-}
select : Select
select =
  { ui = "select"
  , size =
    { isSmall = "is-small"
    , isMedium = "is-medium"
    , isLarge = "is-large"
    , isFullwidth = "is-fullwidth"
    }
  , state =
    { isHovered = "is-hovered"
    , isFocused = "is-focused"
    , isActive = "is-active"
    , isLoading = "is-loading"
    , isDisabled = "is-disabled"
    }
  , addon =
    { isExpanded = "is-expanded"
    }
  }

{-| Docs: http://bulma.io/documentation/elements/form/

__UI element label:__

    label.ui --> "label"

-}
label : Label
label =
  { ui = "label"
  }

{-| Docs: http://bulma.io/documentation/elements/form/

__UI element help text:__

    help.ui --> "help"

__Color modifiers:__

    help.color.isPrimary --> "is-primary"
    help.color.isInfo --> "is-info"
    help.color.isSuccess --> "is-success"
    help.color.isWarning --> "is-warning"
    help.color.isDanger --> "is-danger"
    help.color.isWhite --> "is-white"
    help.color.isLight --> "is-light"
    help.color.isDark --> "is-dark"
    help.color.isBlack --> "is-black"

-}
help : Help
help =
  { ui = "help"
  , color =
    { isPrimary = "is-primary"
    , isInfo = "is-info"
    , isSuccess = "is-success"
    , isWarning = "is-warning"
    , isDanger = "is-danger"
    , isWhite = "is-white"
    , isLight = "is-light"
    , isDark = "is-dark"
    , isBlack = "is-black"
    }
  }

-- Indicators

{-| *Bold notification blocks, to alert your users of something.*

Docs: http://bulma.io/documentation/elements/notification/

__Notification UI element:__

    notification.ui --> "notification"

__Color modifiers:__

    notification.color.isPrimary --> "is-primary"
    notification.color.isInfo --> "is-info"
    notification.color.isSuccess --> "is-success"
    notification.color.isWarning --> "is-warning"
    notification.color.isDanger --> "is-danger"
    notification.color.isWhite --> "is-white"
    notification.color.isLight --> "is-light"
    notification.color.isDark --> "is-dark"
    notification.color.isBlack --> "is-black"

-}
notification : Notification
notification =
  { ui = "notification"
  , color =
    { isPrimary = "is-primary"
    , isInfo = "is-info"
    , isSuccess = "is-success"
    , isWarning = "is-warning"
    , isDanger = "is-danger"
    , isWhite = "is-white"
    , isLight = "is-light"
    , isDark = "is-dark"
    , isBlack = "is-black"
    }
  }

{-| *Native HTML progress bars.*

Docs: http://bulma.io/documentation/elements/progress/

__Progress UI element:__

    progress.ui --> "progress"

__Size modifiers:__

    progress.size.isSmall --> "is-small"
    progress.size.isMedium --> "is-medium"
    progress.size.isLarge --> "is-large"

__Color modifiers:__

    progress.color.isPrimary --> "is-primary"
    progress.color.isInfo --> "is-info"
    progress.color.isSuccess --> "is-success"
    progress.color.isWarning --> "is-warning"
    progress.color.isDanger --> "is-danger"
    progress.color.isWhite --> "is-white"
    progress.color.isLight --> "is-light"
    progress.color.isDark --> "is-dark"
    progress.color.isBlack --> "is-black"

-}
progress : Progress
progress =
  { ui = "progress"
  , size =
    { isSmall = "is-small"
    , isMedium = "is-medium"
    , isLarge = "is-large"
    }
  , color =
    { isPrimary = "is-primary"
    , isInfo = "is-info"
    , isSuccess = "is-success"
    , isWarning = "is-warning"
    , isDanger = "is-danger"
    , isWhite = "is-white"
    , isLight = "is-light"
    , isDark = "is-dark"
    , isBlack = "is-black"
    }
  }

{-| *Small tag labels to insert anywhere.*

Docs: http://bulma.io/documentation/elements/tag/

__Tag UI element:__

    tag.ui --> "tag"

__Size modifiers:__

    tag.size.isMedium --> "is-medium"
    tag.size.isLarge --> "is-large"

__Color modifiers:__

    tag.color.isPrimary --> "is-primary"
    tag.color.isInfo --> "is-info"
    tag.color.isSuccess --> "is-success"
    tag.color.isWarning --> "is-warning"
    tag.color.isDanger --> "is-danger"
    tag.color.isWhite --> "is-white"
    tag.color.isLight --> "is-light"
    tag.color.isDark --> "is-dark"
    tag.color.isBlack --> "is-black"

-}
tag : Tag
tag =
  { ui = "tag"
  , size =
    { isMedium = "is-medium"
    , isLarge = "is-large"
    }
  , color =
    { isPrimary = "is-primary"
    , isInfo = "is-info"
    , isSuccess = "is-success"
    , isWarning = "is-warning"
    , isDanger = "is-danger"
    , isWhite = "is-white"
    , isLight = "is-light"
    , isDark = "is-dark"
    , isBlack = "is-black"
    }
  }


{-| Special formatting for numerical output

__Number UI element:__

    number.ui --> "number"
-}
number : Number
number =
  { ui = "number"
  }


-- Page layout components

{-| *A simple container to divide your page into sections.*

Docs: http://bulma.io/documentation/layout/section/

__Page section:__

    section.container --> "section"

__Spacing modifiers:__

    section.spacing.isMedium --> "is-medium"
    section.spacing.isLarge --> "is-large"

-}
section : Section
section =
  { container = "section"
  , spacing =
    { isMedium = "is-medium"
    , isLarge = "is-large"
    }
  }

{-| *A simple responsive footer which can include anything: lists, headings,
columns, icons, buttons...*

Docs: http://bulma.io/documentation/layout/footer/

__Page footer:__

    footer.container --> "footer"

-}
footer : Footer
footer =
  { container = "footer"
  }

{-| *A responsive horizontal nav bar that can contain links, tabs, buttons,
icons, and a logo.*

Docs: http://bulma.io/documentation/components/nav/

__Nav container:__

    nav.container --> "nav"

__Nav partitions:__

    nav.left --> "nav-left"
    nav.center --> "nav-center"
    nav.right --> "nav-right"

__Nav responsive components:__

    nav.toggle --> "nav-toggle"
    nav.menu.container --> "nav-menu"

    -- State modifier (menu)
      nav.menu.state.isActive --> "is-active"

__Nav items:__

    nav.item.container --> "nav-item"

    -- Style modifier
      nav.item.style.isTab --> "is-tab"

    -- State modifier
      nav.item.state.isActive --> "is-active"

__Style modifier (container):__

    nav.style.hasShadow --> "hasShadow"

-}
nav : Nav
nav =
  { container = "nav"
  , left = "nav-left"
  , center = "nav-center"
  , right = "nav-right"
  , toggle = "nav-toggle"
  , menu =
    { container = "nav-menu"
    , state =
      { isActive = "is-active"
      }
    }
  , item =
    { container = "nav-item"
    , style =
      { isTab = "is-tab"
      }
    , state =
      { isActive = "is-active"
      }
    }
  , style =
    { hasShadow = "has-shadow"
    }
  }

{-| *An imposing hero banner to showcase something.*

Docs: http://bulma.io/documentation/layout/hero/

__Hero banner:__

    hero.container --> "hero"

__Hero partitions:__

    hero.head --> "hero-head"
    hero.body --> "hero-body"
    hero.foot --> "hero-foot"

__Hero UI components:__

    hero.video --> "hero-video"
    hero.buttons --> "hero-buttons"

__Style modifier (container):__

    hero.style.isBold --> "is-bold"

__Size modifiers (container):__

    hero.size.isMedium --> "is-medium"
    hero.size.isLarge --> "is-large"
    hero.size.isFullheight --> "is-fullheight"

__Color modifiers (container):__

    hero.color.isPrimary --> "is-primary"
    hero.color.isInfo --> "is-info"
    hero.color.isSuccess --> "is-success"
    hero.color.isWarning --> "is-warning"
    hero.color.isDanger --> "is-danger"
    hero.color.isWhite --> "is-white"
    hero.color.isLight --> "is-light"
    hero.color.isDark --> "is-dark"
    hero.color.isBlack --> "is-black"

-}
hero : Hero
hero =
  { container = "hero"
  , head = "hero-head"
  , body = "hero-body"
  , foot = "hero-foot"
  , video = "hero-video"
  , buttons = "hero-buttons"
  , style =
    { isBold = "is-bold"
    }
  , size =
    { isMedium = "is-medium"
    , isLarge = "is-large"
    , isFullheight = "is-fullheight"
    }
  , color =
    { isPrimary = "is-primary"
    , isInfo = "is-info"
    , isSuccess = "is-success"
    , isWarning = "is-warning"
    , isDanger = "is-danger"
    , isWhite = "is-white"
    , isLight = "is-light"
    , isDark = "is-dark"
    , isBlack = "is-black"
    }
  }

{-| *A multi-purpose horizontal level, which can contain almost any other element.*

Docs: http://bulma.io/documentation/components/level/

__Level container:__

    level.container --> "level"

__Level partitions:__

    level.left --> "level-left"
    level.right --> "level-right"

__Level items:__

    level.item --> "level-item"

__Responsive modifier (level container):__

    level.mobile.isHorizontal --> "is-mobile"

-}
level : Level
level =
  { container = "level"
  , left = "level-left"
  , right = "level-right"
  , item = "level-item"
  , mobile =
    { isHorizontal = "is-mobile"
    }
  }


-- Section layout components

{-| A horizontally centered container for featured content.

Docs: http://bulma.io/documentation/layout/container/

__Featured content container:__

    feature.container --> "container"

__Sizing modifier (removes `max-width`):__

    feature.sizing.isFluid --> "is-fluid"
-}
feature : Feature
feature =
  { container = "container"
  , sizing =
    { isFluid = "is-fluid"
    }
  }


{-| *A simple way to build responsive columns.*

Docs: http://bulma.io/documentation/grid/columns/

__Columns need to be inside a container:__

    columns.container --> "columns"

__Each column also needs its own container:__

    columns.column.container

    --Column width modifiers
    columns.column.width.isOneQuarter --> "is-one-quarter"
    columns.column.width.isOneThird --> "is-one-third"
    columns.column.width.isHalf --> "is-half"
    columns.column.width.isTwoThirds --> "is-two-thirds"
    columns.column.width.isThreeQuarters --> "is-three-quarters"
    columns.column.width.is1 --> "is-1"
    columns.column.width.is2 --> "is-2"
    columns.column.width.is3 --> "is-3"
    columns.column.width.is4 --> "is-4"
    columns.column.width.is5 --> "is-5"
    columns.column.width.is6 --> "is-6"
    columns.column.width.is7 --> "is-7"
    columns.column.width.is8 --> "is-8"
    columns.column.width.is9 --> "is-9"
    columns.column.width.is10 --> "is-10"
    columns.column.width.is11 --> "is-11"
    columns.column.width.isNarrow --> "is-narrow"

    --Column offset modifiers
    columns.column.offset.isOneQuarter --> "is-offset-one-quarter"
    columns.column.offset.isOneThird --> "is-offset-one-third"
    columns.column.offset.isHalf --> "is-offset-half"
    columns.column.offset.isTwoThirds --> "is-offset-two-thirds"
    columns.column.offset.isThreeQuarters --> "is-offset-three-quarters"
    columns.column.offset.is1 --> "is-offset-1"
    columns.column.offset.is2 --> "is-offset-2"
    columns.column.offset.is3 --> "is-offset-3"
    columns.column.offset.is4 --> "is-offset-4"
    columns.column.offset.is5 --> "is-offset-5"
    columns.column.offset.is6 --> "is-offset-6"
    columns.column.offset.is7 --> "is-offset-7"
    columns.column.offset.is8 --> "is-offset-8"
    columns.column.offset.is9 --> "is-offset-9"
    columns.column.offset.is10 --> "is-offset-10"
    columns.column.offset.is11 --> "is-offset-11"

__Alignment modifiers (columns container):__

    columns.alignment.isCentered --> "is-centered"
    columns.alignment.isVCentered --> "is-vcentered"

__Spacing modifiers (columns container):__

    columns.spacing.isMultiline --> "is-multiline"
    columns.spacing.isGapless --> "is-gapless"
    columns.spacing.isGrid --> "is-grid"

__Display modifiers (columns container):__

    columns.display.onMobile = "is-mobile"
    columns.display.onlyDesktop = "is-desktop"

-}
columns : Columns
columns =
  { container = "columns"
  , column =
    { container = "column"
    , width =
      { isOneQuarter = "is-one-quarter"
      , isOneThird = "is-one-third"
      , isHalf = "is-half"
      , isTwoThirds = "is-two-thirds"
      , isThreeQuarters = "is-three-quarters"
      , is1 = "is-1"
      , is2 = "is-2"
      , is3 = "is-3"
      , is4 = "is-4"
      , is5 = "is-5"
      , is6 = "is-6"
      , is7 = "is-7"
      , is8 = "is-8"
      , is9 = "is-9"
      , is10 = "is-10"
      , is11 = "is-11"
      , isNarrow = "is-narrow"
      }
    , offset =
      { isOneQuarter = "is-offset-one-quarter"
      , isOneThird = "is-offset-one-third"
      , isHalf = "is-offset-half"
      , isTwoThirds = "is-offset-two-thirds"
      , isThreeQuarters = "is-offset-three-quarters"
      , is1 = "is-offset-1"
      , is2 = "is-offset-2"
      , is3 = "is-offset-3"
      , is4 = "is-offset-4"
      , is5 = "is-offset-5"
      , is6 = "is-offset-6"
      , is7 = "is-offset-7"
      , is8 = "is-offset-8"
      , is9 = "is-offset-9"
      , is10 = "is-offset-10"
      , is11 = "is-offset-11"
      }
    }
  , alignment =
    { isCentered = "is-centered"
    , isVCentered = "is-vcentered"
    }
  , spacing =
    { isMultiline = "is-multiline"
    , isGapless = "is-gapless"
    , isGrid = "is-grid"
    }
  , display =
    { onMobile = "is-mobile"
    , onlyDesktop = "is-desktop"
    }
  }


{-| *A single tile element to build 2-dimensional Metro-like, Pinterest-like, or
whatever-you-like grids.*

Docs: http://bulma.io/documentation/grid/tiles/

__Nestable container for tile grids:__

    tile.container --> "tile"

__Tile level designators:__

    tile.level.isAncestor --> "is-ancestor"
    tile.level.isParent --> "is-parent"
    tile.level.isChild --> "is-child"

__Tile orientation designator:__

    tile.orientation.isVertical --> "is-vertical"

__Tile width modifiers:__

    tile.width.is1 --> "is-1"
    tile.width.is2 --> "is-2"
    tile.width.is3 --> "is-3"
    tile.width.is4 --> "is-4"
    tile.width.is5 --> "is-5"
    tile.width.is6 --> "is-6"
    tile.width.is7 --> "is-7"
    tile.width.is8 --> "is-8"
    tile.width.is9 --> "is-9"
    tile.width.is10 --> "is-10"
    tile.width.is11 --> "is-11"

-}
tile : Tile
tile =
  { container = "tile"
  , level =
    { isAncestor = "is-ancestor"
    , isParent = "is-parent"
    , isChild = "is-child"
    }
  , orientation =
    { isVertical = "is-vertical"
    }
  , width =
    { is1 = "is-1"
    , is2 = "is-2"
    , is3 = "is-3"
    , is4 = "is-4"
    , is5 = "is-5"
    , is6 = "is-6"
    , is7 = "is-7"
    , is8 = "is-8"
    , is9 = "is-9"
    , is10 = "is-10"
    , is11 = "is-11"
    }
  }


{-| *The inevitable HTML table, with special case cells.*

Docs: http://bulma.io/documentation/elements/table/

__Table element class:__

    table.container --> "table"

__Style modifiers:__

    table.style.isBordered --> "is-bordered"
    table.style.isStriped --> "is-striped"

__Spacing modifier:__

    table.spacing.isNarrow --> "is-narrow"

-}
table : Table
table =
  { container = "table"
  , style =
    { isBordered = "is-bordered"
    , isStriped = "is-striped"
    }
  , spacing =
    { isNarrow = "is-narrow"
    }
  }


-- UI components for navigation/controls

{-| *A simple menu, for any type of vertical navigation.*

Docs: http://bulma.io/documentation/components/menu/

__Menu container:__

    menu.container --> "menu"

__Element class for menu labels:__

    menu.label --> "menu-label"

__Element class for list of menu options (apply to `ul` element):__

    menu.list --> "menu-list"

-}
menu : Menu
menu =
  { container = "menu"
  , label = "menu-label"
  , list = "menu-list"
  }


{-| *Simple responsive horizontal navigation tabs, with different styles.*

Docs: http://bulma.io/documentation/components/tabs/

__Tabs container:__

    tabs.container --> "tabs"

__Style modifiers:__

    tabs.style.isBoxed --> "is-boxed"
    tabs.style.isToggle --> "is-toggle"

__Alignment modifier:__

    tabs.alignment.isCentered --> "is-centered"
    tabs.alignment.isRight --> "is-right"

__Size modifiers:__

    tabs.size.isSmall --> "is-small"
    tabs.size.isMedium --> "is-medium"
    tabs.size.isLarge --> "is-large"
    tabs.size.isFullWidth --> "is-full-width"

-}
tabs : Tabs
tabs =
  { container = "tabs"
  , style =
    { isBoxed = "is-boxed"
    , isToggle = "is-toggle"
    }
  , alignment =
    { isCentered = "is-centered"
    , isRight = "is-right"
    }
  , size =
    { isSmall = "is-small"
    , isMedium = "is-medium"
    , isLarge = "is-large"
    , isFullWidth = "is-full-width"
    }
  }


{-| *A composable panel, for compact controls.*

Docs: http://bulma.io/documentation/components/panel/

__Panel container:__

    panel.container --> "panel"

__Panel subcomponents:__

    panel.heading --> "panel-heading"
    panel.tabs --> "panel-tabs"

    --Block subcomponent
    panel.block.container --> "panel-block"
    panel.block.icon --> "panel-icon"
    panel.block.state.isActive --> "is-active"

-}
panel : Panel
panel =
  { container = "panel"
  , heading = "panel-heading"
  , tabs = "panel-tabs"
  , block =
    { container = "panel-block"
    , icon = "panel-icon"
    , state =
      { isActive = "is-active"
      }
    }
  }


{-| *A responsive, usable, and flexible pagination.*

Docs: http://bulma.io/documentation/components/pagination/

__Pagination container:__

    pagination.container --> "pagination"

__Element classes for navigation buttons:__

    pagination.previous --> "pagination-previous"
    pagination.next --> "pagination-next"

__Element classes for pagination list:__

    pagination.list.container --> "pagination-list"
    pagination.list.link --> "pagination-link"
    pagination.list.ellipsis --> "pagination-ellipsis"

__Position modifiers for pagination list (pagination container):__

    pagination.position.isCentered --> "is-centered"
    pagination.position.isRight --> "is-right"

-}
pagination : Pagination
pagination =
  { container = "pagination"
  , previous = "pagination-previous"
  , next = "pagination-next"
  , list =
    { container = "pagination-list"
    , link = "pagination-link"
    , ellipsis = "pagination-ellipsis"
    }
  , position =
    { isCentered = "is-centered"
    , isRight = "is-right"
    }
  }


-- UI components for content/media

{-| *An all-around flexible and composable component.*

Docs: http://bulma.io/documentation/components/card/

__Card container:__

    card.container --> "card"

__Card subcomponents:__

    card.image --> "card-image"
    card.content --> "card-content"

    --Header subcomponent
    card.header.container --> "card-header"
    card.header.title --> "card-header-title"
    card.header.icon --> "card-header-icon"

    --Footer subcomponent
    card.footer.container --> "card-footer"
    card.footer.item --> "card-footer-item"

-}
card : Card
card =
  { container = "card"
  , image = "card-image"
  , content = "card-content"
  , header =
      { container = "card-header"
      , title = "card-header-title"
      , icon = "card-header-icon"
      }
  , footer =
      { container = "card-footer"
      , item = "card-footer-item"
      }
  }


{-| *The famous media object prevalent in social media interfaces, but useful in
any context.*

Docs: http://bulma.io/documentation/components/media-object/

__Media object container:__

    media.container --> "media"

__Media object partitions:__

    media.left --> "media-left"
    media.right --> "media-right"
    media.content --> "media-content"

__Size modifier (media container):__

    media.size.isLarge --> "is-large"

-}
media : Media
media =
  { container = "media"
  , left = "media-left"
  , right = "media-right"
  , content = "media-content"
  , size =
    { isLarge = "is-large"
    }
  }


{-| *Colored message blocks, to emphasize part of your page.*

Docs: http://bulma.io/documentation/components/message/

__Message container:__

    message.container --> "message"

__Message subcomponents:__

    message.header --> "message-header"
    message.body --> "message-body"

__Color modifiers (message container):__

    message.color.isPrimary --> "is-primary"
    message.color.isInfo --> "is-info"
    message.color.isSuccess --> "is-success"
    message.color.isWarning --> "is-warning"
    message.color.isDanger --> "is-danger"
    message.color.isWhite --> "is-white"
    message.color.isLight --> "is-light"
    message.color.isDark --> "is-dark"
    message.color.isBlack --> "is-black"

-}
message : Message
message =
  { container = "message"
  , header = "message-header"
  , body = "message-body"
  , color =
    { isPrimary = "is-primary"
    , isInfo = "is-info"
    , isSuccess = "is-success"
    , isWarning = "is-warning"
    , isDanger = "is-danger"
    , isWhite = "is-white"
    , isLight = "is-light"
    , isDark = "is-dark"
    , isBlack = "is-black"
    }
  }

{-| *A classic modal overlay, in which you can include any content you want.*

Docs: http://bulma.io/documentation/components/modal/

__Modal container:__

    modal.container --> "modal"

__Modal subcomponents:__

    modal.background --> "modal-background"
    modal.content --> "modal-content"

    --Close UI element
    modal.close.ui --> "modal.close"
    modal.close.size.isSmall --> "is-small"
    modal.close.size.isMedium --> "is-medium"
    modal.close.size.isLarge --> "is-large"

    --Card subcomponent
    modal.card.container --> "modal-card"
    modal.card.head --> "modal-card-head"
    modal.card.title --> "modal-card-title"
    modal.card.body --> "modal-card-body"
    modal.card.foot --> "modal-card-foot"

__State modifier (message container):__

    modal.state.isActive --> "is-active"

-}
modal : Modal
modal =
  { container = "modal"
  , background = "modal-background"
  , content = "modal-content"
  , close =
    { ui = "modal-close"
    , size =
      { isSmall = "is-small"
      , isMedium = "is-medium"
      , isLarge = "is-large"
      }
    }
  , card =
    { container = "modal-card"
    , head = "modal-card-head"
    , title = "modal-card-title"
    , body = "modal-card-body"
    , foot = "modal-card-foot"
    }
  , state =
    { isActive = "is-active"
    }
  }
