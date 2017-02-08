//
// Created by Stephen Marquis on 5/20/16.
// Copyright (c) 2016 Workday Inc. All rights reserved.
//

@import UIKit;

@class TransactionInfo;
@class WDGenericViewController;
@class WDStyledModalViewController;
typedef NS_ENUM(NSInteger, WDTransactionTransitionType) {
   WDTransactionTransitionTypeNone,
   WDTransactionTransitionTypeModal,
   WDTransactionTransitionTypePushOnStack,
   WDTransactionTransitionTypePushOnMainStack,
   WDTransactionTransitionTypeCrossFade,
   WDTransactionTransitionTypeFullScreenModal,
   WDTransactionTransitionTypeFullScreenModalWithNavigation,
};

NS_ASSUME_NONNULL_BEGIN

@interface WDTransaction: NSObject<NSCopying>

@property (nonatomic, strong) NSString *transactionKey;

@property (nonatomic, assign) BOOL shouldResetTransactionStack;

@property (nonatomic, assign) BOOL continuation;
@property (nonatomic, assign) BOOL refresh;

@property (nonatomic, assign) BOOL requiresMainStack;

// If set to YES, ignores any provided transactionViewController, showing a LoadingViewController for its transaction
@property (nonatomic, assign) BOOL isLoadingTransaction; // TODO: Get this hooked up correctly for all transaction

@property (nonatomic, strong) WDGenericViewController *transactionViewController;

@property (nonatomic, assign) BOOL prefersModal; // Defaults to NO, if YES the transaction manager will present transaction modally if it can
@property (nonatomic, assign) WDTransactionTransitionType desiredModalTransition; // Only used if 'prefersModal' is YES

// Transaction lifecycle calls

- (void)willCommitWithPreviousTransactionInfos:(NSArray<TransactionInfo *> *)infos;
- (void)willPerformTransition:(WDTransactionTransitionType)transition fromTransaction:(nullable WDTransaction *)transaction;
// If a subclass handles setting up the back button itself, it should return false
- (BOOL)willUseBackButtonAsCancel;
// By default returns nil (allowing the transaction manager to create the styled modal). If you want to customize the styled modal used
// override in subclass
- (nullable WDStyledModalViewController *)willUseStyledModal;
- (void)didCommitTransaction;
// Called after a transaction becomse visible, either after the initial commit or being shown again after a pop.
- (void)didBecomeVisible;

// If a new transaction info is returned, the manager will pop all transactions up to and including the returned info.
// So to pop all transactions, return the first in the array
- (nullable TransactionInfo *)willPopWithTransactionInfos:(NSArray<TransactionInfo *> *)infos;
// Called when the transaction gets removed from the stack
- (void)didPopTransactionWhileInvalid:(BOOL)invalid;

@end

NS_ASSUME_NONNULL_END
