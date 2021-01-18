#
#  Be sure to run `pod spec lint ScoringView.podspec' to ensure this is a
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

  spec.name         = "ScoringView"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of ScoringView."
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  spec.name          = "ScoringView"
  spec.version       = "0.0.1"
  spec.summary       = "iOS SDK for ScoringView"
  spec.description   = "iOS SDK for ScoringView"
  spec.homepage      = "https://github.com/UmutSERIFLER/ScoringView"
  spec.license       = "MIT"
  spec.author        = "UmutSERIFLER"
  spec.platform      = :ios, "11.0"
  spec.swift_version = "5.0"
  spec.source        = {
    :git => "https://github.com/UmutSERIFLER/ScoringView.git",
    :tag => "#{spec.version}"
  }
  spec.source_files        = "ScoringView/**/*.{h,m,swift}"
  spec.public_header_files = "ScoringView/**/*.h"



end
