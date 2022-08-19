module Fastlane
  module Actions
    module SharedValues
      SATS_CHANGELOG_CUSTOM_VALUE = :SATS_CHANGELOG_CUSTOM_VALUE
    end

    class SatsChangelogAction < Action
      def self.run(params)
        scheme = params[:scheme]

        UI.message "Creating changelog for scheme: #{scheme}"

        sh "./fastlane/scripts/changelog.sh"
      end

      def self.description
        "Creates git based changelog"
      end

      def self.details
        "Based on the scheme it creates a changelog based on the tag versions. Dev and Test creates from latest tag to main, while Beta and Prod creates between the two latest tags."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :scheme,
                                       env_name: "FL_SATS_CHANGELOG_SCHEME",
                                       description: "The scheme that is currently being built",
                                       is_string: true, 
                                       default_value: "DemoApp") # the default value if the user didn't provide one
        ]
      end

      def self.return_value
        "The generated changlog for the given scheme"
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
