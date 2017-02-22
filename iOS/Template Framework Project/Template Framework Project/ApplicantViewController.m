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
//static NSString *const kSelectorAlertView = @"selectorAlertView";
static NSString *const kFullTime = @"Full Time";
static NSString *const kPartTime = @"Part Time";
static NSString *const kInternship = @"Internship";
static NSString *const kYes = @"Yes";
static NSString *const kMaybe = @"Maybe";
static NSString *const kNo = @"No";


XLFormRowDescriptor *fnameRow;
XLFormRowDescriptor *lnameRow;
XLFormRowDescriptor *emailRow;
XLFormRowDescriptor *phoneRow;
XLFormRowDescriptor *addressRow;
XLFormRowDescriptor *websitesRow;


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
    row.value = [self.applicantInstance getFName];
    fnameRow = row;
    [section addFormRow:row];

    // Last Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kLName rowType:XLFormRowDescriptorTypeText title:@"Last Name"];
    row.required = YES;
    row.value = [self.applicantInstance getLName];
    lnameRow = row;
    [section addFormRow:row];
    
    // Email
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kEmail rowType:XLFormRowDescriptorTypeEmail title:@"Email"];
    // validate the email
    [row addValidator:[XLFormValidator emailValidator]];
    row.value = [self.applicantInstance getEmail];
    emailRow = row;
    [section addFormRow:row];
    
    // Phone
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kPhone rowType:XLFormRowDescriptorTypePhone title:@"Phone"];
    row.value = [self.applicantInstance getPhoneNumber];
    phoneRow = row;
    [section addFormRow:row];
    
    // Address
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kAddress rowType:XLFormRowDescriptorTypeZipCode title:@"Address"];
    row.value = self.rawInfo;
    addressRow = row;
    [section addFormRow:row];
    
    // Websites
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kWebsite rowType:XLFormRowDescriptorTypeURL title:@"Websites"];
    websitesRow = row;
    [section addFormRow:row];

//    section = [XLFormSectionDescriptor formSection];
//    [form addFormSection:section];
    
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:kSelectorAlertView rowType:XLFormRowDescriptorTypeSelectorAlertView title:@"Position Type"];
//    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Full Time"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Part Time"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Internship"],
//                            ];
//    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Choose One"];
//    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Position Type"];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kFullTime rowType:XLFormRowDescriptorTypeBooleanCheck title:@"Full Time"];
    [section addFormRow:row];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kPartTime rowType:XLFormRowDescriptorTypeBooleanCheck title:@"Part Time"];
    [section addFormRow:row];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kInternship rowType:XLFormRowDescriptorTypeBooleanCheck title:@"Internship"];
    [section addFormRow:row];

    // Yes No Maybe
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kYes rowType:XLFormRowDescriptorTypeBooleanCheck title:@"Yes"];
    [section addFormRow:row];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kMaybe rowType:XLFormRowDescriptorTypeBooleanCheck title:@"Maybe"];
    [section addFormRow:row];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kNo rowType:XLFormRowDescriptorTypeBooleanCheck title:@"No"];
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
    
    [self loadFormFields];
}

//Function to load the form fields from parsed data
-(void)loadFormFields{
    fnameRow.value = [self.applicantInstance getFName];
    [self reloadFormRow:fnameRow];
    lnameRow.value = [self.applicantInstance getLName];
    [self reloadFormRow:lnameRow];
    emailRow.value = [self.applicantInstance getEmail];
    [self reloadFormRow:emailRow];
    addressRow.value = [self.applicantInstance getAddress];
    [self reloadFormRow:addressRow];
    phoneRow.value = [self.applicantInstance getPhoneNumber];
    [self reloadFormRow:phoneRow];
    websitesRow.value = [[self.applicantInstance getWebsites] componentsJoinedByString:@" "];
    [self reloadFormRow:websitesRow];
}

- (void)sendImage {
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos
                                 usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                                     if (nil != group) {
                                         // be sure to filter the group so you only get photos
                                         [group setAssetsFilter:[ALAssetsFilter allPhotos]];
                                         
                                         if (group.numberOfAssets > 0) {
                                             [group enumerateAssetsAtIndexes:[NSIndexSet indexSetWithIndex:group.numberOfAssets - 1]
                                                                     options:0
                                                                  usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                                                                      if (nil != result) {
                                                                          ALAssetRepresentation *repr = [result defaultRepresentation];
                                                                          // this is the most recent saved photo
                                                                          UIImage *img = [UIImage imageWithCGImage:[repr fullResolutionImage]];
                                                                          [[[HTTPRequester alloc] init] sendHttpPostPicture:img withID:self.applicantID];
                                                                          
                                                                          // we only need the first (most recent) photo -- stop the enumeration
                                                                          *stop = YES;
                                                                      }
                                                                  }];
                                         }
                                     }
                                     
                                     *stop = NO;
                                 } failureBlock:^(NSError *error) {
                                     NSLog(@"error: %@", error);
                                 }];
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
    //[newApplicant setResume:[self.applicantInstance getResume]];
    //[newApplicant setWebsites:[aSites objectAtIndex:0]];

    //[newApplicant initApplicant:aName withEmail:aEmail withPhoneNum:aPhone withAddress:aAddr];
    //HTTPRequester *requester = [[HTTPRequester alloc] init];
    NSDictionary * jsonToSend = [newApplicant toJSON];
    //[[[HTTPRequester alloc] init] sendHttpPost:jsonToSend withID:self.applicantID];
    //[self sendImage];
    //[[[HTTPRequester alloc] init] sendHttpPostPicture:[self.applicantInstance getResume] withID:self.applicantID];
    [[[HTTPRequester alloc] init] httpPostCandidate:jsonToSend withImage:[self.applicantInstance getResume] withID:self.applicantID];
    //- (void)httpPostCandidate:(NSDictionary *)postDict withImage:(UIImage *)imageToPost withID:(NSString *)currentID {


    //NSLog
    
    
}


@end
