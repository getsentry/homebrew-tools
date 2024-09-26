class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.36.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.36.3/sentry-cli-Darwin-universal"
    sha256 "051766eb09a46533e914101ae3d8aeaab942a954ea1ac760399e95edfadef7e5"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.3/sentry-cli-Linux-aarch64"
        sha256 "fbafab83e3f1b5dc9ef733524957a4c9fb3d5c607f2be0b11e9f031e36909cce"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.3/sentry-cli-Linux-armv7"
        sha256 "0df14e031072adac8db4333f8938fb00129042a525dcb954cfa7cefed6226a3a"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.3/sentry-cli-Linux-x86_64"
        sha256 "f1cb3f3936230c20ae4ab20802614fa208063d6239f7d29e06abb0917a934118"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.3/sentry-cli-Linux-i686"
        sha256 "11cbd514da50e9e030361c3a032ae2ea50aa1b8279be6b4d53d0afbf82d84ea5"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
