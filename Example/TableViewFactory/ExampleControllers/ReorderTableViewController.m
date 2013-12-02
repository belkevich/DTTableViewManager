//
//  ReorderTableViewController.m
//  TableViewFactory
//
//  Created by Denys Telezhkin on 10/16/12.
//  Copyright (c) 2012 Denys Telezhkin. All rights reserved.
//

#import "ReorderTableViewController.h"

@implementation ReorderTableViewController

-(void)addExampleCells
{
    DTTableViewMemoryStorage * storage = self.dataStorage;
    
    [storage addTableItem:[Example exampleWithText:@"Section 1 cell" andDetails:@""] toSection:0];
    [storage addTableItem:[Example exampleWithText:@"Section 1 cell" andDetails:@""] toSection:0];
    [storage addTableItem:[Example exampleWithText:@"Section 2 cell" andDetails:@""] toSection:1];
    [storage addTableItem:[Example exampleWithText:@"Section 3 cell" andDetails:@""] toSection:2];
    [storage addTableItem:[Example exampleWithText:@"Section 3 cell" andDetails:@""] toSection:2];
    [storage addTableItem:[Example exampleWithText:@"Section 3 cell" andDetails:@""] toSection:2];
    
    [storage setSectionHeaderModels:@[@"Section 1", @"Section 2", @" Section 3"]];
}

#pragma  mark - edit button

-(void)setEditNavigationButton
{
    UIBarButtonItem * editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(editModeTapped:)];
    self.navigationItem.rightBarButtonItem = editButton;
}

-(void)setDoneNavigationButton
{
    UIBarButtonItem * editButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(doneTapped:)];
    self.navigationItem.rightBarButtonItem = editButton;
}



-(void)editModeTapped:(UIBarButtonItem *)editButton
{
    [self.tableView setEditing:YES animated:YES];
    [self setDoneNavigationButton];
}

-(void)doneTapped:(UIBarButtonItem *)editButton
{
    [self.tableView setEditing:NO animated:YES];
    [self setEditNavigationButton];
}

#pragma  mark - view activity

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.dataStorage = [DTTableViewMemoryStorage storageWithDelegate:self];
    self.title = @"Reorder";
    
    [self addExampleCells];
    
    [self setEditNavigationButton];
}

#pragma mark - TableView delegate methods

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}


@end
