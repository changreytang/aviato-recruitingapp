//
//  ApplicantViewController.m
//  Template Framework Project
//
//  Created by Tim Liew on 11/17/16.
//

#import "ApplicantViewController.h"
#import "XLForm.h"

static NSString *const kName = @"name";
static NSString *const kEmail = @"email";
static NSString *const kPhone = @"phone";
static NSString *const kAddress = @"address";
static NSString *const kWebsite = @"websites";
static NSString *const kNotes = @"notes";
static NSString *const kSelectorAlertView = @"selectorAlertView";

@interface ApplicantViewController ()

@end


@implementation ApplicantViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initializeForm];
    }
    return self;
}

#pragma mark - Helper

- (void)initializeForm {
    XLFormDescriptor * form = [XLFormDescriptor formDescriptorWithTitle:@"Text Fields"];
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form.assignFirstResponderOnShow = YES;
    
    // Basic Information - Section
    section = [XLFormSectionDescriptor formSectionWithTitle:@"TextField Types"];
    section.footerTitle = @"Aviato";
    [form addFormSection:section];
    
    // Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kName rowType:XLFormRowDescriptorTypeText title:@"Name"];
    row.required = YES;
    row.value = self.rawInfo;
    [section addFormRow:row];
    
    // Email
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kEmail rowType:XLFormRowDescriptorTypeEmail title:@"Email"];
    // validate the email
    [row addValidator:[XLFormValidator emailValidator]];
    row.value = self.rawInfo;
    [section addFormRow:row];
    
    // Phone
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kPhone rowType:XLFormRowDescriptorTypePhone title:@"Phone"];
    row.value = self.rawInfo;
    [section addFormRow:row];
    
    // Address
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kAddress rowType:XLFormRowDescriptorTypeZipCode title:@"Address"];
    row.value = self.rawInfo;
    [section addFormRow:row];
    
    // Websites
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kWebsite rowType:XLFormRowDescriptorTypeURL title:@"Websites"];
    [section addFormRow:row];

//    section = [XLFormSectionDescriptor formSection];
//    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorAlertView rowType:XLFormRowDescriptorTypeSelectorAlertView title:@"Position Type"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Full Time"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Part Time"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Internship"],
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Choose One"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kNotes rowType:XLFormRowDescriptorTypeTextView title:@"Notes"];
    [section addFormRow:row];
    
    self.form = form;

}

@end
