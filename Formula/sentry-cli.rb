class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.2.1"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.2.1/sentry-cli-Darwin-universal"
    sha256 "8bf3ace107204af74d7c2612e86aa7f0629ba2cb7fa8381ef8d5cf9db7a8dd59"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.1/sentry-cli-Linux-aarch64"
        sha256 "3ca6c6a692aa1b0f2b838716c7a6d55aa32a70056602b8feac3eb81c580f028e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.1/sentry-cli-Linux-armv7"
        sha256 "e4cec54b03763eda8a4e46a67af53844e738193cad398cd2c5c3d78995fc3e8d"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.1/sentry-cli-Linux-x86_64"
        sha256 "0cb98d8acc75815d64c5a8fb8c050939c4c82e2a13aee48a7803416aae8a7ac5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.1/sentry-cli-Linux-i686"
        sha256 "ffec5f1026a654086b42edcc9ccc413129b700d9f3fa94d44777e2f626eb458e"
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
