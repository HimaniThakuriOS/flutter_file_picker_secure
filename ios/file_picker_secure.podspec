#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name                  = 'file_picker_secure'
  s.version               = '0.0.3'
  s.summary               = 'A flutter plugin to show native file picker dialogs'
  s.description           = <<-DESC
A flutter plugin to show native file picker dialogs.
                       DESC
  s.homepage              = 'https://github.com/HimaniThakuriOS/flutter_file_picker_secure'
  s.license               = { :file => '../LICENSE' }
  s.author                = 'Himani Thakur'
  s.source                = { :path => '.' }
  s.source_files          = 'Classes/**/*'
  s.public_header_files   = 'Classes/**/*.h'
  
  s.ios.deployment_target = '11.0'

  s.dependency 'Flutter'

  preprocess_definitions=[]
  if !Pod.const_defined?(:PICKER_MEDIA) || PICKER_MEDIA
    preprocess_definitions << "PICKER_MEDIA=1"
    s.dependency 'DKImagePickerController/PhotoGallery'
  end
  if !Pod.const_defined?(:PICKER_AUDIO) || PICKER_AUDIO
    preprocess_definitions << "PICKER_AUDIO=1"
  end
  if !Pod.const_defined?(:PICKER_DOCUMENT) || PICKER_DOCUMENT
    preprocess_definitions << "PICKER_DOCUMENT=1"
  end
  s.pod_target_xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => preprocess_definitions.join(' ') }

end

