GO_EASY_ON_ME = 1
ARCHS = arm64 arm64e
include theos/makefiles/common.mk

ADDITIONAL_CFLAGS = -fobjc-arc -Os -Qunused-arguments -Itemp -Wno-c++11-extensions -Xclang -fobjc-runtime-has-weak

# export SDKVERSION=9.3
SDKVERSION = 13.7
INCLUDE_SDKVERSION = 13.7
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 13.0
TARGET_CC = xcrun -sdk iphoneos clang
TARGET_CXX = xcrun -sdk iphoneos clang++
TARGET_LD = xcrun -sdk iphoneos clang++
SHARED_CFLAGS = -fobjc-arc

TWEAK_NAME = FLEXInjected

# find ./FLEX -name \*.m -print | grep Classes | rev | cut -d"/" -f1 | rev | sed -e "s/^/temp\//" | tr "\\n" " "

FLEXInjected_FILES = Tweak.xm temp/FLEXArgumentInputColorView.m temp/FLEXArgumentInputDateView.m temp/FLEXArgumentInputFontsPickerView.m temp/FLEXArgumentInputFontView.m temp/FLEXArgumentInputJSONObjectView.m temp/FLEXArgumentInputNotSupportedView.m temp/FLEXArgumentInputNumberView.m temp/FLEXArgumentInputStringView.m temp/FLEXArgumentInputStructView.m temp/FLEXArgumentInputSwitchView.m temp/FLEXArgumentInputTextView.m temp/FLEXArgumentInputView.m temp/FLEXArgumentInputViewFactory.m temp/FLEXDefaultEditorViewController.m temp/FLEXFieldEditorView.m temp/FLEXFieldEditorViewController.m temp/FLEXIvarEditorViewController.m temp/FLEXMethodCallingViewController.m temp/FLEXPropertyEditorViewController.m temp/FLEXExplorerViewController.m temp/FLEXWindow.m temp/FLEXMultiColumnTableView.m temp/FLEXRealmDatabaseManager.m temp/FLEXSQLiteDatabaseManager.m temp/FLEXTableColumnHeader.m temp/FLEXTableContentCell.m temp/FLEXTableContentViewController.m temp/FLEXTableLeftCell.m temp/FLEXTableListViewController.m temp/FLEXClassesTableViewController.m temp/FLEXCookiesTableViewController.m temp/FLEXFileBrowserFileOperationController.m temp/FLEXFileBrowserSearchOperation.m temp/FLEXFileBrowserTableViewController.m temp/FLEXGlobalsTableViewController.m temp/FLEXInstancesTableViewController.m temp/FLEXLibrariesTableViewController.m temp/FLEXLiveObjectsTableViewController.m temp/FLEXWebViewController.m temp/FLEXSystemLogMessage.m temp/FLEXSystemLogTableViewCell.m temp/FLEXSystemLogTableViewController.m temp/FLEXManager.m temp/FLEXNetworkHistoryTableViewController.m temp/FLEXNetworkRecorder.m temp/FLEXNetworkSettingsTableViewController.m temp/FLEXNetworkTransaction.m temp/FLEXNetworkTransactionDetailTableViewController.m temp/FLEXNetworkTransactionTableViewCell.m temp/FLEXNetworkObserver.m temp/FLEXArrayExplorerViewController.m temp/FLEXClassExplorerViewController.m temp/FLEXDefaultsExplorerViewController.m temp/FLEXDictionaryExplorerViewController.m temp/FLEXGlobalsTableViewControllerEntry.m temp/FLEXImageExplorerViewController.m temp/FLEXLayerExplorerViewController.m temp/FLEXObjectExplorerFactory.m temp/FLEXObjectExplorerViewController.m temp/FLEXSetExplorerViewController.m temp/FLEXViewControllerExplorerViewController.m temp/FLEXViewExplorerViewController.m temp/FLEXExplorerToolbar.m temp/FLEXToolbarItem.m temp/FLEXHeapEnumerator.m temp/FLEXKeyboardHelpViewController.m temp/FLEXKeyboardShortcutManager.m temp/FLEXMultilineTableViewCell.m temp/FLEXResources.m temp/FLEXRuntimeUtility.m temp/FLEXUtility.m temp/FLEXHierarchyTableViewCell.m temp/FLEXHierarchyTableViewController.m temp/FLEXImagePreviewViewController.m

FLEXInjected_FRAMEWORKS = UIKit CoreGraphics QuartzCore ImageIO
FLEXInjected_LDFLAGS = -lz -lsqlite3

BUNDLE_NAME = FLEXInjectedBundle
FLEXInjectedBundle_INSTALL_PATH = /var/jb/Library/MobileSubstrate/DynamicLibraries
include $(THEOS)/makefiles/bundle.mk

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

flatten_flex:
	cp "`find ./FLEX -name "*.m"`" ./temp/
	cp "`find ./FLEX -name "*.h"`" ./temp/

