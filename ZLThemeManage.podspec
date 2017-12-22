

Pod::Spec.new do |s|

  s.name         = "ZLThemeManage"
  s.version      = "0.0.2"
  s.summary      = " ZLThemeManage can be used to manage you resource like  color,image ."

  s.description  = <<-DESC
    this is used to manage themes for my app. you can have a test.
    ZLThemeManage can be used to manage you resource like  color,image .
                   DESC

  s.homepage     = "https://github.com/wzhilong/ZLThemeManage"

  s.license      = "MIT"
 
  s.author             = { "18355557686@163.com" => "18355557686@163.com" }
  

  s.source       = { :git => "https://github.com/wzhilong/ZLThemeManage.git", :tag => "0.0.2" }


  s.source_files  = "ZLThemesManage/ZLThemesManage/ZLThemesManage/*", "ZLThemesManage/ZLThemesManage/ZLThemesManage/**/*.{h,m}"
  
  s.public_header_files = "ZLThemesManage/ZLThemesManage/ZLThemesManage.h"


   s.resources = "ZLThemesManage/res/*.*"
  s.frameworks = "Foundation", "UIKit"

 
end
