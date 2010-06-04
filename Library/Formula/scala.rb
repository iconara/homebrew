require 'formula'

class Scala <Formula
  homepage 'http://www.scala-lang.org/'
  url 'http://www.scala-lang.org/downloads/distrib/files/scala-2.8.0.RC3.tgz'
  version '2.8.0.RC3'
  md5 '81a6a33311423ed556db793970da8300'

  def shim_script target
    <<-EOS.undent
      #!/bin/sh
      exec #{libexec}/bin/#{target} $*
    EOS
  end

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    man.install Dir['man/*']
    bin.mkpath
    Dir["#{libexec}/bin/*"].each do |b|
      n = Pathname.new(b).basename
      (bin+n).write shim_script(n)
    end
  end
  
end
