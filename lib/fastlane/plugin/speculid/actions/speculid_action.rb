require 'fastlane/action'
require_relative '../helper/speculid_helper'

module Fastlane
  module Actions
    class SpeculidAction < Action
      def self.run(params)
        unless File.file?("/Applications/Speculid.app/Contents/SharedSupport/speculid")
          UI.error("Speculid is not installed. Please go to https://speculid.com to download and install.")
          return
        end

        Dir.glob("**/*.speculid") do |path|
          system("/Applications/Speculid.app/Contents/SharedSupport/speculid", "--process", path)
        end
      end

      def self.description
        "Use speculid to Easily Manage Graphics in Xcode Projects"
      end

      def self.authors
        ["Leo Dion"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Speculid links a single graphic file to an Image Set or App Icon and automatically renders different resolutions, file types, and sizes for all the image specifications required."
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "SPECULID_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
