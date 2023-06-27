class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.1.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.1.4/sentry-cli-Darwin-universal"
    sha256 "94e1249b692301e7287ce059bbff83a68d9568e134bcb196bee79a20813b0c69"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.1.4/sentry-cli-Linux-aarch64"
        sha256 "0e04e810af16520b39a4edb3dd163edd5991de4ea479e55834cf4ac7e36bfa90"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.1.4/sentry-cli-Linux-armv7"
        sha256 "1b97cce44b32ef10f992dbf627e75632ad72cdc00d9b06e9d75b7676f632ae86"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.1.4/sentry-cli-Linux-x86_64"
        sha256 "272fefd13e7076cec6aa1896820f4edf7d1e4478781a2c3538cfb7a62dee1214"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.1.4/sentry-cli-Linux-i686"
        sha256 "2003f137a2038c431723508680c01d058e35eea2db789f0ffc22d667c2c3f9be"
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
