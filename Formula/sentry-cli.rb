class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.69.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.69.1/sentry-cli-Darwin-universal"
    sha256 "a8714c0c3c39b190d068bb2a52cab53f9518af18f87527f5a76fbbcd9f46f720"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.69.1/sentry-cli-Linux-aarch64"
        sha256 "dc015a2f3f8d02b40733fcb489e0a5ae9164789126cb1a629f2bc0cda6790b1c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.69.1/sentry-cli-Linux-armv7"
        sha256 "1acddde0ee75147037c3e6f5d224a0ac3e4deff1103d458ef566aaf817aec229"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.69.1/sentry-cli-Linux-x86_64"
        sha256 "4bed363e76e853aa1855b228b73b1e13a6b71209ce699bb0a117f98d6cfd8962"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.69.1/sentry-cli-Linux-i686"
        sha256 "4cc7ec006d2b10267fef6c3af339545b96433c72b78d0cbefc0589a96d04d0bc"
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
