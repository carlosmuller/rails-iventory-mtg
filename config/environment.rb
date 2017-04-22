# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

BASE_IMAGE_URI = 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=%d&type=card'