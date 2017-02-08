//
//  Created by Scott Kovatch on 4/17/14.
//  Copyright (c) 2014 Workday. All rights reserved.
//

@import UIKit;

@class WDStyleDefault;

NS_ASSUME_NONNULL_BEGIN

extern WDStyleDefault * gStyle;

extern UIColor* UIColorFromRGB(NSUInteger rgbValue);
extern UIColor* UIColorFromRGBWithAlpha(NSUInteger rgbValue, CGFloat alpha);
extern UIColor* UIColorFromComponents(NSUInteger red, NSUInteger green, NSUInteger blue);
extern UIColor* UIColorFromComponentsWithAlpha(NSUInteger red, NSUInteger green, NSUInteger blue, CGFloat alpha);

typedef NS_ENUM(NSUInteger, WDLabelStyle) {
    WDLabelStyleH1Dark,
    WDLabelStyleH1White,
    WDLabelStyleH1ThemeColor,
    WDLabelStyleH1Other,

    WDLabelStyleH2Dark,
    WDLabelStyleH2White,
    WDLabelStyleH2ThemeColor,

    WDLabelStyleH3Dark,
    WDLabelStyleH3White,
    WDLabelStyleH3ThemeColor,

    WDLabelStyleH4Dark,
    WDLabelStyleH4White,
    WDLabelStyleH4ThemeColor,
    WDLabelStyleH4Other,

    WDLabelStyleH5Dark,
    WDLabelStyleH5White,
    WDLabelStyleH5ThemeColor,
    WDLabelStyleH5Other,

    WDLabelStyleH6Dark,
    WDLabelStyleH6White,
    WDLabelStyleH6ThemeColor,
    WDLabelStyleH6Other,

    WDLabelStyleH7ThemeColor,
    WDLabelStyleH7White,
    WDLabelStyleH7Dark,

    WDLabelStyleTitleDark,
    WDLabelStyleTitleWhite,
    WDLabelStyleTitleThemeColor,

    WDLabelStyleBodyDark,
    WDLabelStyleBodyWhite,
    WDLabelStyleBodyThemeColor,
    WDLabelStyleBodyOther,

    WDLabelStyleClock,
    WDLabelStyleClockSeconds,
    
    WDLabelStylePercent,

    WDLabelStyleDarkTextIPadButton,
    WDLabelStyleDarkTextIPhoneButton,
    WDLabelStyleLightTextIPadButton,
    WDLabelStyleLightTextIPhoneButton,
    
    WDLabelStyleSubtitleLight,
};

typedef NS_ENUM(NSUInteger, WDColorTheme) {
    WDColorThemeNone,
    WDColorThemeBlue,
    WDColorThemeGreen, // 0xA8C97F
    WDColorThemeOrange, // 0xF6BB7B
};

extern NSString * const kWDStyleFontRegular;
extern NSString * const kWDStyleFontItalic;
extern NSString * const kWDStyleFontBold;
extern NSString * const kWDStyleFontBoldItalic;
extern NSString * const kWDStyleFontLight;
extern NSString * const kWDStyleFontThin;
extern NSString * const kWDEventBackgroundChanged;

@class WDLabelStyleDescriptor;
@class WDGridCellStyle;

@interface WDStyleDefault : NSObject

@property (nonatomic, assign) BOOL useCustomFonts;

- (void)clearCache;
- (NSString *)themeIconModifier;
- (WDLabelStyleDescriptor *)themeLabelStyleDescriptorForStyle:(WDLabelStyle)labelStyle;
- (WDLabelStyleDescriptor *)labelStyleDescriptorForStyle:(WDLabelStyle)labelStyle;
- (NSDictionary *)attributesForLabelStyle:(WDLabelStyle)labelStyle;
- (NSString *)backgroundImageName;
- (void)resetCurrentColorTheme;

- (NSString *)fontStyleForFontSize:(CGFloat)fontSize;
- (UIFont *)scaledFontForFontNamed:(NSString *)fontName size:(CGFloat)fontSize;

@property (nonatomic, assign) WDColorTheme currentColorTheme;
@property (nonatomic, assign, readonly) UIColor *homepageOverlayColorForCurrentTheme;
@property (nonatomic, assign) NSArray<UIColor *> *backgroundColorsArrayForCurrentColorTheme;
@property (nonatomic, assign) UIColor *middleGradientColorForCurrentColorTheme;
@property (nonatomic, readonly) UIColor *pillBadgeBackgroundColorForCurrentColorTheme;

@property (nonatomic, readonly) CGFloat navigationBarHeight;

@property (nonatomic, readonly) CGFloat largeButtonHeight;

@property (nonatomic, readonly) UIColor *separatorLineColor;
@property (nonatomic, readonly) UIColor *whiteSeparatorLineColor;
@property (nonatomic, readonly) CGFloat separatorLineWidth;
@property (nonatomic, readonly) CGFloat separatorLineInsetForPadAndModal;

- (CGFloat)defaultSmallChartCellHeight;

// colors
@property (nonatomic, readonly) UIColor *mainBackgroundColor;   // formerly lightGrayBlue
@property (nonatomic, readonly) UIColor *masterBackgroundColor;   // formerly lightGray
@property (nonatomic, readonly) UIColor *maxBackgroundColor;
@property (nonatomic, readonly) UIColor *maxHeaderBackgroundColor;
@property (nonatomic, readonly) UIColor *menuColor;
@property (nonatomic, readonly) UIColor *selectedGrayMenuColor;
@property (nonatomic, readonly) UIColor *grayMenuColorGradientStart;
@property (nonatomic, readonly) UIColor *grayMenuColorGradientEnd;
@property (nonatomic, readonly) UIColor *loadingBlueBackgroundColor;
@property (nonatomic, readonly) UIColor *dashboardItemBackgroundColor;   // formerly lightGray
@property (nonatomic, readonly) UIColor *darkGridBackgroundColor;
@property (nonatomic, readonly) UIColor *gridButtonColor;
@property (nonatomic, readonly) UIColor *chartHeaderBackgroundColor;
@property (nonatomic, readonly) UIColor *modalBackgroundColor;   // formerly lightTurquoise
@property (nonatomic, readonly) UIColor *modalFooterBackgroundColor;    // formerly lightBlue
@property (nonatomic, readonly) UIColor *progressiveGridLightCellColor;
@property (nonatomic, readonly) UIColor *progressiveGridDarkCellColor;
@property (nonatomic, readonly) UIColor *toolbarBackgroundColor;
@property (nonatomic, readonly) UIColor *selectedCollectionViewCellBackgroundColor;
@property (nonatomic, readonly) UIColor *calendarTodayBackgroundColor;
@property (nonatomic, readonly) UIColor *addNewButtonBackgroundColor;

@property (nonatomic, readonly) UIColor *gridLineColor;
@property (nonatomic, readonly) UIColor *maxHorizontalGridLineColor;
@property (nonatomic, readonly) UIColor *maxVerticalGridLineColor;
@property (nonatomic, readonly) UIColor *maxGridLightBodyBackgroundColor;
@property (nonatomic, readonly) UIColor *maxGridDarkBodyBackgroundColor;
@property (nonatomic, readonly) UIColor *maxGridCellHighlightColor;
@property (nonatomic, readonly) UIColor *selectedGridCellBackgroundColor;
@property (nonatomic, readonly) UIColor *selectedGridCellBorderColor;

@property (nonatomic, readonly) UIColor *darkTextColor;
//Use on gray background
@property (nonatomic, readonly) UIColor *lightGrayTextColor; //Use on white background
@property (nonatomic, readonly) UIColor *axisColor;
@property (nonatomic, readonly) UIColor *barButtonItemTintColorIcon;
@property (nonatomic, readonly) UIColor *barButtonItemTintColorOther;
@property (nonatomic, readonly) UIColor *barButtonItemTintColorToggle;
@property (nonatomic, readonly) NSDictionary *barButtonItemDoneTextAttributes;
@property (nonatomic, readonly) NSDictionary *barButtonItemOtherTextAttributes;
@property (nonatomic, readonly) UIColor *popoverHeaderBackgroundColor;
@property (nonatomic, readonly) UIColor *popoverBorderColor;

@property (nonatomic, readonly) UIColor *alternatingRowColorEven;
@property (nonatomic, readonly) UIColor *alternatingRowColorOdd;

@property (nonatomic, readonly) UIColor *racetrackColumnLineColor;
@property (nonatomic, readonly) UIColor *racetrackHeaderRowColor;

// spacing
@property (nonatomic, readonly) CGFloat arrowHeight;
@property (nonatomic, readonly) CGFloat padding;
@property (nonatomic, readonly) CGFloat modalPadding;
@property (nonatomic, readonly) CGFloat maxCornerRadius;
@property (nonatomic, readonly) CGFloat tableViewCellHeight;
@property (nonatomic, readonly) CGFloat tableViewCellLargeHeight;

// animations
@property (nonatomic, readonly) CGFloat springDampingRatio;
@property (nonatomic, readonly) NSTimeInterval entryAnimationDelay;
@property (nonatomic, readonly) NSTimeInterval reloadAnimationDelay;

// fonts
@property (nonatomic, readonly) UIFont *textPickerFont;
@property (nonatomic, readonly) UIFont *textPickerFontSelected;
@property (nonatomic, readonly) UIFont *actionSheetTitleFont;
@property (nonatomic, readonly) UIFont *actionSheetBodyFont;

// MAX
@property (nonatomic, readonly) UIColor *widgetLabelRequiredColor;
@property (nonatomic, readonly) UIColor *widgetErrorForegroundColor;
@property (nonatomic, readonly) UIColor *widgetErrorBackgroundColor;
@property (nonatomic, readonly) UIColor *widgetWarningForegroundColor;
@property (nonatomic, readonly) UIColor *widgetWarningBackgroundColor;
@property (nonatomic, readonly) UIColor *selectedHighlightedCellBackgroundColor;
@property (nonatomic, readonly) UIColor *selectedHighlightedWarningCellBackgroundColor;
@property (nonatomic, readonly) UIColor *selectedHighlightedErrorCellBackgroundColor;
@property (nonatomic, readonly) UIColor *backgroundColorForModalTransition;

@property (nonatomic, readonly) CGFloat promptHorizontalSpacing;
@property (nonatomic, readonly) CGFloat promptHeaderVerticalSpacing;
@property (nonatomic, readonly) CGSize popoverContentSize;

@property (nonatomic, readonly) CGFloat widgetVerticalSpacing;
@property (nonatomic, readonly) CGFloat widgetComponentSpacing;
@property (nonatomic, readonly) CGFloat iPhoneWidgetPageSideInset;
@property (nonatomic, readonly) CGFloat iPadWidgetPageSideInset;
@property (nonatomic, readonly) CGFloat iPadFullscreenLandscapeSideInset;
@property (nonatomic, readonly) CGFloat iPadFullscreenPortraitSideInset;

@property (nonatomic, readonly) CGFloat monikerHeadIndent;

@property (nonatomic, readonly) CGFloat modalEditPageLeftRightInsetWidth;
@property (nonatomic, readonly) CGFloat editPageLeftRightInsetWidth;


// Sizing
@property (nonatomic, readonly) CGFloat legendHeight;
@property (nonatomic, readonly) CGFloat flagLegendHeight;
@property (nonatomic, readonly) CGFloat smallLegendHeight;
@property (nonatomic, readonly) CGFloat legendPadding;
@property (nonatomic, readonly) CGFloat elementSpacing;

//reports
@property (nonatomic, readonly) UIColor *axisLineColor;
@property (nonatomic, readonly) UIColor *valueLineColor;
@property (nonatomic, readonly) UIColor *zeroLineColor;
@property (nonatomic, readonly) UIColor *flagColor;
@property (nonatomic, readonly) UIColor *flagLineColor;
@property (nonatomic, readonly) CGFloat flagBase;
@property (nonatomic, readonly) CGFloat flagHeight;
@property (nonatomic, readonly) UIColor *reportBackgroundColor;
@property (nonatomic, readonly) UIColor *smallChartBackgroundColor;
@property (nonatomic, readonly) UIColor *multipleComparisonLineDarkColor;
@property (nonatomic, readonly) UIColor *moreSliceStartColor;
@property (nonatomic, readonly) UIColor *moreSliceEndColor;
@property (nonatomic, readonly) CGFloat largeColumnWidth;
@property (nonatomic, readonly) CGFloat kpiFullscreenCellWidth;
@property (nonatomic, readonly) CGFloat gridLineThickness;

@property (nonatomic, readonly) UIColor *scatterPositiveColor;
@property (nonatomic, readonly) UIColor *scatterNegativeColor;
@property (nonatomic, readonly) UIColor *scatterNeutralColor;
@property (nonatomic, readonly) UIColor *scatterNoCategoryColor;


//Faceted Search
@property (nonatomic, readonly) UIColor *facetedSearchSelectedFilterCellColor;
@property (nonatomic, readonly) UIColor *facetedSearchFilterByCellColor;
@property (nonatomic, readonly) UIColor *searchTextFieldPlaceHolderColor;
@property (nonatomic, readonly) CGFloat searchTextFieldHeight;
@property (nonatomic, readonly) CGFloat facetedSearchHeaderHeight;

//Time Entry
@property (nonatomic, readonly) UIColor *timeEntrySelectedDayStartColor;
@property (nonatomic, readonly) UIColor *timeEntrySelectedDayEndColor;
@property (nonatomic, readonly) UIColor *timeEntryBlockBackgroundColor;

//Mobile Stylized Buttons
@property (nonatomic, readonly) UIFont *msbSubtitleFont;
@property (nonatomic, readonly) UIColor *msbSubtitleColor;
@property (nonatomic, readonly) UIColor *msbAlertTitleLabelColor;
@property (nonatomic, readonly) UIColor *msbAlertSubtitleLabelColor;
@property (nonatomic, readonly) UIColor *msbAlertBorderColor;
@property (nonatomic, readonly) UIColor *msbAlertBackgroundColor;
@property (nonatomic, readonly) UIColor *msbBarButtonDividingLineColor;
// Job Application Stage
@property (nonatomic, readonly) UIColor *jobApplicationBackgroundFillColor;
@property (nonatomic, readonly) UIColor *jobApplicationLineColor;

// Contact Info
@property (nonatomic, readonly) UIColor *contactInfoContactDetailsBackgroundColor;

//Error View
@property (nonatomic, readonly) UIColor *exceptionBackgroundColor;
@property (nonatomic, readonly) UIColor *criticalExceptionTextColor;
@property (nonatomic, readonly) UIColor *criticalExceptionBorderColor;
@property (nonatomic, readonly) UIColor *warningExceptionTextColor;
@property (nonatomic, readonly) UIColor *warningExceptionBorderColor;

// PanelSlider
@property (nonatomic, readonly) UIColor *panelSliderBackgroundColor;
@property (nonatomic, readonly) UIColor *panelSliderAddNewTextColor;
@property (nonatomic, readonly) UIFont *panelSliderAddNewTextFont;
@property (nonatomic, readonly) UIColor *panelSliderAddNewBorderColor;
@property (nonatomic, readonly) UIColor *panelSliderAddNewBackgroundColor;

// Panel Header
@property (nonatomic, readonly) UIColor *panelHeaderBackgroundColor;
// Homepage
@property (nonatomic, readonly) CGFloat motionEffectOffset;

// Inbox
@property (nonatomic, readonly) CGFloat inboxHeaderHeight;

@property (nonatomic, readonly) UIColor *clockTimeSeparatorTextColor;

#pragma mark Old style properties

//menu
@property (nonatomic, readonly) CGFloat statusBarOffset;

// colors
@property (nonatomic, readonly) UIColor *masterSelectionColor;   // formerly lightTurquoise

@property (nonatomic, readonly) UIColor *shadowColor;
@property (nonatomic, readonly) UIColor *lineColor;

@property (nonatomic, readonly) UIColor *errorTextColor;
@property (nonatomic, readonly) UIColor *disabledTextColor;
@property (nonatomic, readonly) UIColor *navTitleTextColor;




@property (nonatomic, readonly) UIColor *barButtonItemTintColorSubmit;
@property (nonatomic, readonly) UIColor *barButtonItemTintColorDone;
@property (nonatomic, readonly) UIColor *richTextBarButtonItemTintColor;

// spacing
@property (nonatomic, readonly) CGFloat buttonHeight;
@property (nonatomic, readonly) CGSize badgeViewSize;
@property (nonatomic, readonly) CGFloat shadowHeight;
@property (nonatomic, readonly) CGFloat tableviewShadowHeight;  // same as charts and grids
@property (nonatomic, readonly) CGFloat shadowAlpha;
@property (nonatomic, readonly) CGFloat calendarHeaderHeight;
@property (nonatomic, readonly) CGFloat workerProfileContentWidth;

// WDMedia
@property (nonatomic, readonly) UIFont *mediaTimestampFont;
@property (nonatomic, readonly) UIFont *mediaTitleLabelFont;
@property (nonatomic, readonly) UIFont *mediaCellTextLabelFont;
@property (nonatomic, readonly) UIFont *mediaCellDetailTextLabelFont;
@property (nonatomic, readonly) UIFont *mediaErrorFont;
@property (nonatomic, readonly) UIFont *mediaDetailErrorFont;

@end

#pragma mark - StyleGuide

@interface WDLabelStyleDescriptor : NSObject <NSCopying>
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong, nullable) UIColor *shadowColor;
@property (nonatomic, assign) CGSize shadowOffset;
@property (nonatomic, strong, nullable) UIColor *layerShadowColor;
@property (nonatomic, assign) CGSize layerShadowOffset;
@property (nonatomic, assign) CGFloat layerShadowRadius;
@property (nonatomic, assign) CGFloat layerShadowOpacity;
@property (nonatomic, assign) BOOL showUnderline;

+ (instancetype)labelStyleDescriptorWithFont:(UIFont *)font textColor:(UIColor *)textColor shadowColor:(nullable UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset;
+ (instancetype)labelStyleDescriptorWithFont:(UIFont *)font textColor:(UIColor *)textColor layerShadowColor:(nullable UIColor *)layerShadowColor layerShadowOffset:(CGSize)layerShadowOffset layerShadowRadius:(CGFloat)layerShadowRadius layerShadowOpacity:(CGFloat)layerShadowOpacity;
+ (instancetype)labelStyleDescriptorWithFont:(UIFont *)font textColor:(UIColor *)textColor;
@end

@interface UILabel (WDStyleDefault)
+ (instancetype)labelWithStyle:(WDLabelStyle)labelStyle;
- (void)applyLabelStyle:(WDLabelStyle)labelStyle;
- (void)applyLabelDescriptor:(WDLabelStyleDescriptor *)labelDescriptor;
@end

@interface UIButton (WDStyleDefault)
- (void)applyLabelStyle:(WDLabelStyle)labelStyle;
@end

@interface UITextView (WDStyleDefault)
- (void)applyLabelStyle:(WDLabelStyle)labelStyle;
@end

@interface UIFont (WDStyleDefault)
- (CGFloat)baselineAdjustmentFromFont:(UIFont *)fromFont;
@end

@interface UIBarButtonItem (WDStyleDefault)

- (void)applyDoneButtonStyle;
- (void)applyOtherButtonStyle;

@end

NS_ASSUME_NONNULL_END
