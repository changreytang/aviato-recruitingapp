//
//  ApplicantViewController.m
//  Template Framework Project
//
//  Created by Tim Liew on 11/17/16.
//

#import "ApplicantViewController.h"
#import "XLForm.h"
#import "HTTPRequester.h"

static NSString *const kFName = @"fname";
static NSString *const kLName = @"lname";
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
    XLFormDescriptor * form = [XLFormDescriptor formDescriptorWithTitle:@"Applicant Information"];
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form.assignFirstResponderOnShow = YES;
    
    
    // Basic Information - Section
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Contact Information"];
    //section.footerTitle = @"Aviato";
    [form addFormSection:section];
    
    // First Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kFName rowType:XLFormRowDescriptorTypeText title:@"First Name"];
    row.required = YES;
    row.value = self.rawInfo;
    [section addFormRow:row];

    // Last Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kLName rowType:XLFormRowDescriptorTypeText title:@"Last Name"];
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
    
    // For Recruiter - Section
    section = [XLFormSectionDescriptor formSectionWithTitle:@"For Recruiter"];
    section.footerTitle = @"Aviato";
    [form addFormSection:section];
    
    //Notes for recruiter
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kNotes rowType:XLFormRowDescriptorTypeTextView title:@"Notes"];
    [section addFormRow:row];
    
    self.form = form;

}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                    style:UIBarButtonItemStyleDone target:self action:@selector(doneBtnPressed:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

-(void)doneBtnPressed:(UIBarButtonItem * )button{
    NSLog(@"%@",self.formValues);
    NSDictionary * values = self.formValues;
    Applicant * newApplicant = [[Applicant alloc] init];
    NSString *aFName = [NSString stringWithString:[values valueForKey:@"fname"]];
    NSString *aLName = [NSString stringWithString:[values valueForKey:@"lname"]];
    NSString *aEmail = [NSString stringWithString:[values valueForKey:@"email"]];
    NSString *aPhone = [NSString stringWithString:[values valueForKey:@"phone"]];
    NSString *aAddr = [NSString stringWithString:[values valueForKey:@"address"]];
    //NSArray *aSites = [NSString stringWithString:[values valueForKey:@"websites"]];
    [newApplicant setFName:aFName];
    [newApplicant setLName:aLName];
    [newApplicant setEmail:aEmail];
    [newApplicant setPhoneNumber:aPhone];
    [newApplicant setAddress:aAddr];
    [newApplicant setID:self.applicantID];
    //[newApplicant setWebsites:[aSites objectAtIndex:0]];

    //[newApplicant initApplicant:aName withEmail:aEmail withPhoneNum:aPhone withAddress:aAddr];
    //HTTPRequester *requester = [[HTTPRequester alloc] init];
    NSData * jsonToSend = [newApplicant toJSON];
    [[[HTTPRequester alloc] init] sendHttpPost:jsonToSend withID:self.applicantID];
    //NSLog
    
    
}


@end
