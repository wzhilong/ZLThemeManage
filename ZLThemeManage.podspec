

Pod::Spec.new do |s|

  s.name         = "ZLThemeManage"
  s.version      = "0.0.4"
  s.summary      = " ZLThemeManage can be used to manage you resource like  color,image ."
  s.platform     = :ios

  s.description  = <<-DESC
    this is used to manage themes for my app. you can have a test.
    ZLThemeManage can be used to manage you resource like  color,image .
                   DESC

  s.homepage     = "https://github.com/wzhilong/ZLThemeManage"

  s.license      = "MIT"
 
  s.author             = { "18355557686@163.com" => "18355557686@163.com" }
  
  s.source       = { :git => "https://github.com/wzhilong/ZLThemeManage.git", :tag => "0.0.4" }

  s.source_files  = "ZLThemeManage/ZLThemesManage/*.{h,m}"
  
  s.public_header_files = "ZLThemeManage/ZLThemesManage/*.h"

  s.frameworks = 'Foundation', 'UIKit'


  s.subspec 'Handle' do |handle|
    handle.source_files = "ZLThemesManage/Handle/**/*.*"
    handle.public_header_files = "ZLThemesManage/handle/*.h"
    handle.framworks = 'Foundation','UIkit'
  end 
  

  s.subspec 'Handle' do |handle|
    handle.source_files = "ZLThemesManage/Handle/**/*.*"
    handle.public_header_files = "ZLThemesManage/handle/*.h"
    handle.framworks = 'Foundation','UIkit'
  end 



end
