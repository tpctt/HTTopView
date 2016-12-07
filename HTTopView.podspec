Pod::Spec.new do |s|
  s.name                  = "HTTopView"
  s.version               = "1.0.1"
  s.summary               = "使用 block 使用 HTHorizontalSelectionList "
  s.homepage              = "https://github.com/tpctt/HTTopView"
  s.social_media_url      = "https://github.com/tpctt/HTTopView"
  s.platform     = :ios,'6.0'
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { " tim" => "491590253@qq.com" }
  s.source                = { :git => "https://github.com/tpctt/HTTopView.git",:tag => s.version.to_s }
  s.ios.deployment_target = "6.0"
  s.requires_arc          = true
  s.framework             = "Foundation","UIKit"
  s.dependency 'HTHorizontalSelectionList'
  s.source_files = 'Classess/**/*.{h,m,mm}'
  
  # s.library		= "z.1.1.3","stdc++","sqlite3"
  # s.subspec 'TableViewWithBlock' do |sp|
  #   sp.source_files = 'TableViewWithBlock/**/*.{h,m,mm}'
  # #  sp.resources   = "Extend/**/*.{png}"
  #   sp.requires_arc = true
   
  # #  sp.dependency 'FontIcon'
  #  # sp.prefix_header_contents = '#import "EasyIOS.h"'
  # end
end
