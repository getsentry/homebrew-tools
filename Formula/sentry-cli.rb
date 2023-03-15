class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.15.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.15.1/sentry-cli-Darwin-universal"
    sha256 "2a74957aa6eda2405f5885440a5a8e19ae5f976b226a6c64cd4f55ee9b8a70ec"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.1/sentry-cli-Linux-aarch64"
        sha256 "ff50dd31f4a715ba6b362a56d1b4e53f0547566f8044fb024160dd54209477c3"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.1/sentry-cli-Linux-armv7"
        sha256 "03f70d2ca5556f923e9829e30ebcaa94ca67cfe066cf3804cfff719d9ac8c38a"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.1/sentry-cli-Linux-x86_64"
        sha256 "05e405eb1bee99a62731e39768059500900e4c5b512731a9ad91aabafec5650a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.1/sentry-cli-Linux-i686"
        sha256 "3917ca31c27387366644b7d703fbcb56128bc92e3925cfb4b15dc0a97776594e"
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
