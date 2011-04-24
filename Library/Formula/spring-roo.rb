require 'formula'

class SpringRoo < Formula
  url 'http://s3.amazonaws.com/dist.springframework.org/release/ROO/spring-roo-1.1.3.RELEASE.zip'
  version '1.1.3'
  homepage 'http://www.springsource.org/roo'
  md5 'b0c0ebc41bb5a153210bf09a31d5a8c8'

  def install
    rm_f Dir["bin/*.bat"]
    prefix.install %w[annotations bin bundle conf docs legal samples]
  end
end
