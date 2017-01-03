//
//  ApplicantViewController.h
//  Template Framework Project
//
//  Created by Tim Liew on 11/17/16.
//

#import <UIKit/UIKit.h>
#import "XLFormViewController.h"
#import "Applicant.h"

@interface ApplicantViewController : XLFormViewController

@property Applicant *applicantInstance;
@property NSString* rawInfo;
@end
