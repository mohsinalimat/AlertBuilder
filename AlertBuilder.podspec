Pod::Spec.new do |s|
  s.name             = 'AlertBuilder'
  s.version          = '0.1.5'
  s.swift_versions   = '5.0'
  s.summary          = 'This is a customizable Alert View.You can add any view in to Alert View while you are creating Alert View.'
 
  s.description      = <<-DESC
This is a customizable Alert View.You can add any view in to Alert View while you are creating Alert View. (Swift)
                       DESC
 
  s.homepage         = 'https://github.com/yucelokan/AlertBuilder'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yucelokan' => 'okan.yucel95@gmail.com' }
  s.source           = { :git => 'https://github.com/yucelokan/AlertBuilder.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '9.0'
  s.source_files = 'Sources/**/*'
 
end
