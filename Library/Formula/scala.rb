require 'formula'

class Scala <Formula
  homepage 'http://www.scala-lang.org/'
  url 'http://www.scala-lang.org/downloads/distrib/files/scala-2.8.0.RC4.tgz'
  version '2.8.0.RC4'
  md5 '56ae7ee34b1792ea58d6c5afdcc39c2f'

  def shim_script target
    <<-EOS.undent
      #!/bin/sh
      exec #{libexec}/bin/#{target} $*
    EOS
  end

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib misc meta]
    man.install Dir['man/*']
    bin.mkpath
    Dir["#{libexec}/bin/*"].each do |b|
      n = Pathname.new(b).basename
      (bin+n).write shim_script(n)
    end
  end
  
end
