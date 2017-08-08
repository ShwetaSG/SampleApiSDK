Pod::Spec.new do |s|

  s.name         = "SampleApiSDK"
  s.version      = "1.0.0"
  s.summary      = "A short description of SampleApiSDK."

  s.description  = "This is completely customised SDK"

  s.homepage     = "http://EXAMPLE/SampleApiSDK"
  
  s.license      = "MIT"

  s.author       = { "Shweta.G" => "shwetagoudar7@gmail.com" }
 
  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/ShwetaSG/SampleApiSDK.git", :tag => "1.0.0" }

  s.source_files  = "SampleApiSDK", "SampleApiSDK/**/*.{h,m,swift}"

  s.resources = "SampleApiSDK/*.mp3"

end
