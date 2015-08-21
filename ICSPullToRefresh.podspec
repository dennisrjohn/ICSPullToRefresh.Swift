Pod::Spec.new do |s|

  s.name         = "ICSPullToRefresh-AnimatedImages"
  s.version      = "0.1.2"
  s.summary      = "Swift PullToRefresh && InfiniteScrolling using animated images"
  s.homepage     = "https://github.com/dennisrjohn/ICSPullToRefresh.Swift"
  s.license      = "MIT"
  s.author       = { "Dennis John" => "dennis.r.john+github@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/dennisrjohn/ICSPullToRefresh.Swift.git", :tag => s.version }

  s.source_files  = "ICSPullToRefresh", "ICSPullToRefresh/**/*.{swift}"

  s.requires_arc = true

end
