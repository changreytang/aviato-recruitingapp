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
    XLFormDescriptor * form = [XLFormDescriptor formDescriptorWithTitle:@"Applicant Information"];
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form.assignFirstResponderOnShow = YES;
    
    
    // Basic Information - Section
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Contact Information"];
    //section.footerTitle = @"Aviato";
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
    /*
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    navBar.backgroundColor = [UIColor whiteColor];
    
    UINavigationItem *navItem = [[UINavigationItem alloc] init];
    navItem.title = @"Applicant Information";
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backBtnPressed:)];
    navItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneBtnPressed:)];
    navItem.rightBarButtonItem = rightButton;
    
    navBar.items = @[navItem];
    
    [self.view addSubview:navBar];
     */
}

-(void)doneBtnPressed:(UIBarButtonItem * )button{

}

-(void)backBtnPressed:(UIBarButtonItem *)button{
    
}
/*
-(IBAction)doneBtnClicked:(id)sender{

}
 */
@end
