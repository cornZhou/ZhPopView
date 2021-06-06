#
#  Be sure to run `pod spec lint ZhPopView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "ZhPopView" #存储库名称
  spec.version      = "0.0.1" #版本号，与tag值一致
  spec.summary      = "ZhPopView summary: 不同弹框效果" #简介
  spec.description  = "ZhPopView description: 不同弹框效果" #描述
  spec.homepage     = "https://github.com/cornZhou/ZhPopView" #项目主页，不是git地址
  spec.license      = { :type => "MIT", :file => "LICENSE" } #开源协议
  spec.author             = { "ZhouHuan" => "1559960608@qq.com" } #作者
  spec.platform     = :ios, "7.0" #支持的平台和版本号
  spec.source       = { :git => "https://github.com/cornZhou/ZhPopView.git", :tag => "0.0.1" } #存储库的git地址，以及tag值


  # .podspec同级路径下的文件夹 xxx 可直接这样写
  # spec.source_files = "xxx"  或者   spec.source_files = "xxx/*.{h,m}"

  # 如果同级文件夹内有子文件夹，需要这么写，这样会加载同级文件夹内的所有文件，包括子文件夹内的文件；
  # spec.source_files = "xxx/**/*.{h,m}"

  # 如果只需要加载某个子文件夹目录下的文件, 一定要逐级添加
  # spec.source_files  = "xxx", "xxx/obj/*.{h,m}"

  spec.source_files  = "ZhPopView/**/*.{h,m}" #需要托管的源代码路径
  spec.requires_arc = true #是否支持ARC
  # s.dependency "Masonry", "~> 1.0.0"    #所依赖的第三方库，没有就不用写
  # spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
