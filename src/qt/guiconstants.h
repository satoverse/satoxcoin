// Copyright (c) 2011-2016 The Bitcoin Core developers
// Copyright (c) 2017-2019 The Raven Core developers
// Copyright (c) 2020-2023 The Satoxcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef SATOXCOIN_QT_GUICONSTANTS_H
#define SATOXCOIN_QT_GUICONSTANTS_H

/* Milliseconds between model updates */
static const int MODEL_UPDATE_DELAY = 250;

/* AskPassphraseDialog -- Maximum passphrase length */
static const int MAX_PASSPHRASE_SIZE = 1024;

/* SatoxcoinGUI -- Size of icons in status bar */
static const int STATUSBAR_ICONSIZE = 16;

static const bool DEFAULT_SPLASHSCREEN = true;

/* Invalid field background style */
#define STYLE_INVALID "background:#FF8080; border: 1px solid lightgray; padding: 0px;"
#define STYLE_VALID "border: 1px solid lightgray; padding: 0px;"

/* Transaction list -- unconfirmed transaction */
#define COLOR_UNCONFIRMED QColor(128, 128, 128)
/* Transaction list -- negative amount */
#define COLOR_NEGATIVE QColor(255, 0, 0)
/* Transaction list -- bare address (without label) */
#define COLOR_BAREADDRESS QColor(140, 140, 140)
/* Transaction list -- TX status decoration - open until date */
#define COLOR_TX_STATUS_OPENUNTILDATE QColor(64, 64, 255)
/* Transaction list -- TX status decoration - offline */
#define COLOR_TX_STATUS_OFFLINE QColor(192, 192, 192)
/* Transaction list -- TX status decoration - danger, tx needs attention */
#define COLOR_TX_STATUS_DANGER QColor(200, 100, 100)
/* Transaction list -- TX status decoration - default color */
#define COLOR_BLACK QColor(0, 0, 0)
/* Widget Background color - default color */
#define COLOR_WHITE QColor(255, 255, 255)

#define COLOR_WALLETFRAME_SHADOW QColor(0,0,0,71)



/** satoxcoin by pform */

/* Color of labels, searchbar border color */
#define COLOR_LABELS QColor("#d10669")
/* Gradient dark dark blue */
#define COLOR_DARK_BLUE QColor("#020710")
/* Gradient light dark blue */
#define COLOR_LIGHT_BLUE QColor("#0d1e35")
/* NOT selected text color */
#define COLOR_TOOLBAR_NOT_SELECTED_TEXT QColor("#ffffff")
/* Selected text color */
#define COLOR_TOOLBAR_SELECTED_TEXT QColor("#d10669")
/* Header text color */
#define STRING_LABEL_COLOR "color: #d10669"
/* warning string color */
#define STRING_LABEL_COLOR_WARNING "color: #d10669"


/** LIGHT MODE */
/* Background color, very light gray */
#define COLOR_BACKGROUND_LIGHT QColor("#fbfbfe")
/* Satoxcoin dark orange */
#define COLOR_DARK_ORANGE QColor("#f05239")
/* Satoxcoin light orange */
#define COLOR_LIGHT_ORANGE QColor("#f79433")

/* Satoxcoin asset text */
#define COLOR_ASSET_TEXT QColor(255, 255, 255)
/* Satoxcoin shadow color - light mode */
#define COLOR_SHADOW_LIGHT QColor("#e1e6f3")



/* Send entries background color */
#define COLOR_SENDENTRIES_BACKGROUND QColor("#fbfbfe")


/** DARK MODE */
/* Widget background color, dark mode */
#define COLOR_WIDGET_BACKGROUND_DARK QColor("#1c2535")
/* Satoxcoin shadow color - dark mode */
#define COLOR_SHADOW_DARK QColor("#191919")
/* Satoxcoin Light blue - dark mode - dark mode */
#define COLOR_LIGHT_BLUE_DARK QColor("#020710")
/* Satoxcoin Dark blue - dark mode - dark mode */
#define COLOR_DARK_BLUE_DARK QColor("#0d1e35")
/* Pricing widget background color */
#define COLOR_PRICING_WIDGET QColor("#020710")
/* Satoxcoin dark mode administrator background color */
#define COLOR_ADMIN_CARD_DARK COLOR_BLACK
/* Satoxcoin dark mode regular asset background color */
#define COLOR_REGULAR_CARD_DARK_BLUE_DARK_MODE QColor("#06132a")
/* Satoxcoin dark mode regular asset background color */
#define COLOR_REGULAR_CARD_LIGHT_BLUE_DARK_MODE QColor("#0e1b3b")
/* Toolbar not selected text color */
#define COLOR_TOOLBAR_NOT_SELECTED_TEXT_DARK_MODE QColor("#ffffff")
/* Toolbar selected text color */
#define COLOR_TOOLBAR_SELECTED_TEXT_DARK_MODE QColor("#c5ccdf")
/* Send entries background color dark mode */
#define COLOR_SENDENTRIES_BACKGROUND_DARK QColor("#1c2535")











/* Tooltips longer than this (in characters) are converted into rich text,
   so that they can be word-wrapped.
 */
static const int TOOLTIP_WRAP_THRESHOLD = 80;

/* Maximum allowed URI length */
static const int MAX_URI_LENGTH = 255;

/* QRCodeDialog -- size of exported QR Code image */
#define QR_IMAGE_SIZE 300

/* Number of frames in spinner animation */
#define SPINNER_FRAMES 36

#define QAPP_ORG_NAME "Satoxcoin"
#define QAPP_ORG_DOMAIN "satoverse.io"
#define QAPP_APP_NAME_DEFAULT "Satoxcoin-Qt"
#define QAPP_APP_NAME_TESTNET "Satoxcoin-Qt-testnet"

#endif // SATOXCOIN_QT_GUICONSTANTS_H
