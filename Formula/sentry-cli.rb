class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.74.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.74.0/sentry-cli-Darwin-universal"
    sha256 "9a619d98b507533db2fff46e788e789f706f489db4572445cbb1949b7bccd2d9"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.0/sentry-cli-Linux-aarch64"
        sha256 "83f2ba621569ded12289e6d140a125ac01eaf9bf087b8f8b425082298246f46d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.0/sentry-cli-Linux-armv7"
        sha256 "71c182d7762e98a74e5a2c5b80341d4cee2a03fddc0d238f29f3f0bcf05658b1"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.0/sentry-cli-Linux-x86_64"
        sha256 "33df0510ed10a2a79ee0aa6ae8edd344a7848cb98ddf5015a784bd93199a88fc"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.0/sentry-cli-Linux-i686"
        sha256 "58944522ec6fa51c471643048cbf03be77e3c815291dd8ed4025aff5aa1be19a"
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
