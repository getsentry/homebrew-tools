class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.5.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.5.2/sentry-cli-Darwin-universal"
    sha256 "abead2d834cd5a99b610e1de71cb4e3f15aef9ffdbf0f968bd9f73bf4aa12a2b"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.2/sentry-cli-Linux-aarch64"
        sha256 "a8f1ed844b37531d4a8b24aee83f2e53024ed0b96ba46d052c11c24feca3bb81"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.2/sentry-cli-Linux-armv7"
        sha256 "c09a2f4e04acb722e371dd12ed03d171bad404eda7fca9b18910e7032a7b23a4"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.2/sentry-cli-Linux-x86_64"
        sha256 "185796be2b7a94be23be9494b56adb213573460e80b27dd4a6369379a089bfd0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.2/sentry-cli-Linux-i686"
        sha256 "b5fd5394ca4fa77e344f5aa01e39225202ab73fb6c94f390f750f1d8c8b242a9"
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
