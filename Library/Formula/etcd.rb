require 'formula'

class Etcd < Formula
  homepage 'https://github.com/coreos/etcd'
  url 'https://github.com/coreos/etcd/archive/v0.4.4.tar.gz'
  sha1 '49cac150a302200eaa253e1ab0c888c7bad9bc8e'
  head 'https://github.com/coreos/etcd.git'

  bottle do
    sha1 "c7a8deb59eb70457121bb704f2cbde3326ea1cf4" => :mavericks
    sha1 "f9ec8e196b23c2911559307bdf803f757081c85d" => :mountain_lion
    sha1 "6ebe588dbc9efa2000f77f8c1e38e73cfb3fd2fb" => :lion
  end

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    system "./build"
    bin.install 'bin/etcd'
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <dict>
          <key>SuccessfulExit</key>
          <false/>
        </dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/etcd</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{var}</string>
      </dict>
    </plist>
    EOS
  end
end
