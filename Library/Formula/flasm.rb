require 'formula'

class Flasm < Formula
  url 'http://www.nowrap.de/download/flasm16mac.tgz'
  homepage 'http://www.nowrap.de/flasm.html'
  md5 'ab4bac7b92bb9999bdfb4ad74683e91a'
  version '1.6.2'

  def install
    bin.install 'flasm'
  end
end
