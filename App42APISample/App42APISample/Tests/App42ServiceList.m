//
//  App42ServiceList.m
//  PAE_iOS_SDK
//
//  Created by Shephertz Technologies Pvt Ltd on 21/10/14.
//  Copyright (c) 2014 ShephertzTechnology PVT LTD. All rights reserved.
//

#import "App42ServiceList.h"

#import "EmailServiceAPIList.h"
#import "RewardServiceAPIList.h"

@interface App42ServiceList ()
{
    NSDictionary *serviceList;
    NSArray *sortedKeys;
    int servicesCount;
}
@end

@implementation App42ServiceList

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // UINavigationBar *navBar = [[UINavigationBar alloc]init];
    // [self.tableView addSubview:navBar];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"App42 Services";
    serviceList = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"App42Services" ofType:@"plist"]];
    servicesCount = 2;//(int)[serviceList count];
    
    sortedKeys = [NSArray arrayWithObjects:@"Email Service",@"Reward Service", nil];////[[NSArray alloc] initWithArray:[[serviceList allKeys] sortedArrayUsingSelector: @selector(caseInsensitiveCompare:)]];
    
    //NSArray * objects = [dict objectsForKeys: sortedKeys notFoundMarker: [NSNull null]];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //NSLog(@"%s",__func__);
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"%s",__func__);
    // Return the number of rows in the section.
    return servicesCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld",(long)indexPath.section,(long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];

        int index = (int)indexPath.row;
        //NSLog(@"Index : %d",index);
        cell.textLabel.text = [sortedKeys objectAtIndex:index];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //NSLog(@"%@",cell.textLabel.text);
    if ([cell.textLabel.text isEqualToString:@"Reward Service"])
    {
        RewardServiceAPIList *serviceAPIList = [[RewardServiceAPIList alloc] initWithStyle:UITableViewStylePlain];
        //NSLog(@"%@",[serviceList objectForKey:cell.textLabel.text]);
        serviceAPIList.apiList = [serviceList objectForKey:cell.textLabel.text];
        [self.navigationController pushViewController:serviceAPIList animated:YES];
    }
    else if ([cell.textLabel.text isEqualToString:@"Email Service"])
    {
        EmailServiceAPIList *serviceAPIList = [[EmailServiceAPIList alloc] initWithStyle:UITableViewStylePlain];
        //NSLog(@"%@",[serviceList objectForKey:cell.textLabel.text]);
        serviceAPIList.apiList = [serviceList objectForKey:cell.textLabel.text];
        [self.navigationController pushViewController:serviceAPIList animated:YES];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}



@end
