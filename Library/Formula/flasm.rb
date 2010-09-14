require 'formula'

<<<<<<< HEAD
class Flasm < Formula
  url 'http://www.nowrap.de/download/flasm16mac.tgz'
  homepage 'http://www.nowrap.de/flasm.html'
  md5 'ab4bac7b92bb9999bdfb4ad74683e91a'
  version '1.6.2'

  def install
    bin.install 'flasm'
=======
class Flasm <Formula
  url 'http://www.nowrap.de/download/flasm16src.zip'
  version '1.62'
  homepage 'http://www.nowrap.de/flasm.html'
  md5 '28a4586409061b385d1cd27d3f120c0b'

  def install
    inreplace "Makefile" do |s|
      s.change_make_var! 'CFLAGS', ENV.cflags
    end

    system "make"
    bin.install "flasm"
>>>>>>> 931e7d23db4c0172bc36bf5224d852db53f85a07
  end
end
