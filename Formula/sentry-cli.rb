class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.22.2-alpha.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.22.2-alpha.0/sentry-cli-Darwin-universal"
    sha256 "ba14c5e8d3b53bab5f27551ba5433939de8128e9ea90f042041601b9cd2f2610"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.2-alpha.0/sentry-cli-Linux-aarch64"
        sha256 "405bfc5545d40ad941782958ed756d68a4cb85164aea544e9cab41c455618ad1"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.2-alpha.0/sentry-cli-Linux-armv7"
        sha256 "bcb7e02d363b39b5a5cc59c040ae8680f2072da44c8bd0f71bd50d12d91ddccb"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.2-alpha.0/sentry-cli-Linux-x86_64"
        sha256 "71f258d4742dc0fd265ddacdf9661f7fe0312b261edef99c6e6ad820765d938d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.2-alpha.0/sentry-cli-Linux-i686"
        sha256 "1a21cbfe502a61f00853551b202fb21afa04dcd672ce5c3907839e8488aae521"
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
