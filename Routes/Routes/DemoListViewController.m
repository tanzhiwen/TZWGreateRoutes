//
//  DemoListViewController.m
//  Routes
//
//  Created by yyy on 2022/3/20.
//

#import "DemoListViewController.h"

static NSMutableDictionary *titleWithHandlers;
static NSMutableArray *titles;

@interface DemoListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) UITableView *tableView;

@end

@implementation DemoListViewController

+ (void)registerWithTitle:(NSString *)title handler:(UIViewController *(^)(void))handler
{
    if (!titleWithHandlers) {
        titleWithHandlers = [[NSMutableDictionary alloc] init];
        titles = [NSMutableArray array];
    }
    [titles addObject:title];
    titleWithHandlers[title] = handler;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MGJRouterDemo";
        
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.view addSubview:self.tableView];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleWithHandlers.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *viewController = ((ViewControllerHandler)titleWithHandlers[titles[indexPath.row]])();
    [self.navigationController pushViewController:viewController animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
