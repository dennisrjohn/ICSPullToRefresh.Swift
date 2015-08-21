# ICSPullToRefresh-AnimatedImages ![MIT License](https://img.shields.io/badge/License-MIT-brightgreen.svg)

ICSPullToRefresh-AnimatedImages is a Fork version of [ICSPullToRefresh-Swift](https://github.com/iCodesign/ICSPullToRefresh.Swift) which adds the ability to use any series of images as the Activity Indicator for both Pull to Refresh and Infinite scrolling

## Installation

> Embedded frameworks require a minimum deployment target of iOS 8. 

### CocoaPods

CocoaPods 0.36 adds supports for Swift and embedded frameworks. 

Add ```pod 'ICSPullToRefresh'``` to your ```Podfile```: 

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'ICSPullToRefresh', '~> 0.1.2'
```

### Manually

You can also integrate ```ICSPullToRefresh``` directly with souce code. Clone the repo and copy ```ICSPullToRefresh.swift``` and ```ICSInfiniteScrolling.swift``` to your project.

## Usage

### PullToRefresh
```
Adding images for activity indicator
```
UIScrollView.configurePullToRefreshAnimation(duration:NSTimeInterval, staticImage:UIImage, animationImages:[UIImage])

```
UIScrollView.addPullToRefreshHandler(() -> ())
```

Start/Stop animating:

```
UIScrollView.pullToRefreshView?.startAnimating()
UIScrollView.pullToRefreshView?.stopAnimating()
```

Trigger manually:

```
UIScrollView.triggerPullToRefresh()
```

Hide pulltorefresh:

```
UIScrollView.setShowsPullToRefresh(Bool)
```

> Since after iOS7, iOS brings ```automaticallyAdjustsScrollViewInsets``` to ```UISrollView``` embedded in a ```UINavigationController``` or ```UITabBarController``` which changes ```contentInset``` of ```UISrollView``` between ```viewDidLoad``` nad ```viewDidAppear```, so you have to put the ```addPullToRefreshHandler``` in  or after ```viewDidAppear```

Example: 

```

tableView.configurePullToRefreshAnimation(1.0, staticImage: UIImage(named: "Loading1")!, animationImages: [UIImage(named: "Loading0")!, UIImage(named: "Loading1")!, UIImage(named: "Loading2")!, UIImage(named: "Loading3")!, UIImage(named: "Loading4")!, UIImage(named: "Loading5")!, UIImage(named: "Loading6")!, UIImage(named: "Loading7")!])
tableView.addPullToRefreshHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
        // do something in the background
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            tableView.pullToRefreshView?.stopAnimating()
        })
    })
}
```

### InfiniteScrolling
```
Adding images for scroll activity indicator
```

UIScrollView.configureInfiniteScrollingAnimation(duration:NSTimeInterval, staticImage:UIImage, animationImages:[UIImage])

```
UIScrollView.addInfiniteScrollingWithHandler(() -> ())
```

Start/Stop animating:

```
UIScrollView.infiniteScrollingView?.startAnimating()
UIScrollView.infiniteScrollingView?.stopAnimating()
```

Trigger manually:

```
UIScrollView.triggerInfiniteScrolling()
```

Hide infiniteScrolling:

```
UIScrollView.setShowsInfiniteScrolling(Bool)
```

> Since after iOS7, iOS brings ```automaticallyAdjustsScrollViewInsets``` to ```UISrollView``` embedded in a ```UINavigationController``` or ```UITabBarController``` which changes ```contentInset``` of ```UISrollView``` between ```viewDidLoad``` nad ```viewDidAppear```, so you have to put the ```addInfiniteScrollingWithHandler``` in  or after ```viewDidAppear```

Example:

```
tableView.configureInfiniteScrollingAnimation(1.0, staticImage: UIImage(named: "Loading1")!, animationImages: [UIImage(named: "Loading0")!, UIImage(named: "Loading1")!, UIImage(named: "Loading2")!, UIImage(named: "Loading3")!, UIImage(named: "Loading4")!, UIImage(named: "Loading5")!, UIImage(named: "Loading6")!, UIImage(named: "Loading7")!])
tableView.addInfiniteScrollingWithActionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
        // do something in the background
        dispatch_async(dispatch_get_main_queue(), { [unowned self] in
            self.tableView.reloadData()
            self.tableView.infiniteScrollingView?.stopAnimating()
        })
    })
}
```

## Credits

Thanks to [ICSPullToRefresh.Swift](https://github.com/iCodesign/ICSPullToRefresh.Swift) and [SVPullToRefresh](https://github.com/samvermette/SVPullToRefresh) by [Sam Vermette](http://samvermette.com).

