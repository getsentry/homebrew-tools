class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.50.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.50.1/sentry-cli-Darwin-universal"
    sha256 "eb118e9dd9dbc1e18382afa6dfd5c26c6d01684d81f9a0a3b95b247af73cc2d5"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.1/sentry-cli-Linux-aarch64"
        sha256 "3d32b3d1ec6e49666a2a5d4c039649273bd50f5143e042e7c791bbada7e11d3a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.1/sentry-cli-Linux-armv7"
        sha256 "203c2cf05f1215f15ccd7b232c7865466a9d86aec4a4ddd27e4e7e3300a2d66b"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.1/sentry-cli-Linux-x86_64"
        sha256 "ad37b364e568da5f47f47bd3a039ede43945cd99a40d16a8778b4167b98bb8c3"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.1/sentry-cli-Linux-i686"
        sha256 "cefd28cf98529e5bcbdef0d604406aeb5789679bed7a6e3188187b62ff765446"
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
