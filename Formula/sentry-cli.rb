class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.56.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.56.0/sentry-cli-Darwin-universal"
    sha256 "820e2a96ca19ffdcfcfaee4da062b7107aa95f2a7a323686d2eb87a028afee20"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.56.0/sentry-cli-Linux-aarch64"
        sha256 "47cf6d5949157ebe3caedd6d1ee75b76c530d8a30680f861a7e61dddd7eed6dc"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.56.0/sentry-cli-Linux-armv7"
        sha256 "e26ca07bca7f7139cb20380eb864a34dd92ad8504e274a5bef22fb48b409892e"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.56.0/sentry-cli-Linux-x86_64"
        sha256 "32177042eb84e0dbd64ce96692e1d0f14b99aad9ffb6023602553f0e1f4706b2"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.56.0/sentry-cli-Linux-i686"
        sha256 "a87d3fa099e17a38b132da924355eadc9416267bd052ee1c85b0c94113de9800"
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
