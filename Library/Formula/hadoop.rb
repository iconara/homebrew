require 'formula'

class Hadoop < Formula
  url 'http://archive.cloudera.com/cdh/2/hadoop-0.20.1+169.89.tar.gz'
  version '0.20.1'
  homepage 'http://hadoop.apache.org/common/'
  md5 'cc688c3988ebbba1eccc6201f6cc3302'

  def shim_script target
    <<-EOS.undent
    #!/bin/bash
    exec #{libexec}/bin/#{target} $*
    EOS
  end

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin conf contrib lib webapps]
    libexec.install Dir['*.jar']
    bin.mkpath
    Dir["#{libexec}/bin/*"].each do |b|
      unless b =~ /\.sh$/
        n = Pathname.new(b).basename
        (bin+n).write shim_script(n)
      end
    end
  end

  def caveats
    <<-EOS.undent
      $JAVA_HOME must be set for Hadoop commands to work.
    EOS
  end
end
