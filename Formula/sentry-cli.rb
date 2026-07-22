class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.6.2"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.6.2/sentry-cli-Darwin-universal"
    sha256 "d1339bc39b2c681496d70fc0cb5263a6f4ff93939de21b1f34cffb310643ef1c"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.2/sentry-cli-Linux-aarch64"
        sha256 "ff112ecf694b7d6b3629a6228ed4e3f7a0d51401bdf48a5051a79d8749dccd06"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.2/sentry-cli-Linux-armv7"
        sha256 "70a92a11d2d4d0c08202158120c0c054e83b6a5b5aff467e4a04cb19ca5440d9"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.2/sentry-cli-Linux-x86_64"
        sha256 "3a4bbf2c0d06378d4e59b337647483751a0a2b1603db5fd4991847d0cfd6478c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.2/sentry-cli-Linux-i686"
        sha256 "d1acfe1ab476c81dd2cc101e541e00403da7dcdf1cf21f4f2cfbe7353637b1de"
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
