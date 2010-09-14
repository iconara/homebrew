require 'formula'

# Require ec2-api-tools to get the base class
require "#{File.dirname __FILE__}/ec2-api-tools.rb"

class Ec2IamTools <AmazonWebServicesFormula
  homepage 'http://developer.amazonwebservices.com/connect/entry.jspa?externalID=4143&categoryID=322'
  url 'http://awsiammedia.s3.amazonaws.com/public/tools/cli/latest/IAMCli.zip'
  version '1.0b'
  md5 '294cc368706588e74e51c113946e494a'

  def install
    mkdir 'bin'
    Dir['iam-*'].each { |f| ohai f; mv f, 'bin' }
    standard_install
  end

  def caveats
    standard_instructions 'IAM_HOME'
  end
end
