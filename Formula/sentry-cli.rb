class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.1.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.1.0/sentry-cli-Darwin-universal"
    sha256 "60f320848ed6f97d1c3ef0a43b5767eda6bc52a31ed3c8ed27c60cadd26f65ed"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.1.0/sentry-cli-Linux-aarch64"
        sha256 "69b4499d9e9bf26a55f7f656dd0ba544bf6d0265bbe4f6ae21b37c90e07ff042"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.1.0/sentry-cli-Linux-armv7"
        sha256 "699e8da7931b5890f929b4c57ca4de3e6f32cc33aa08ff461fd00d998c7131d3"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.1.0/sentry-cli-Linux-x86_64"
        sha256 "1f232077b4e689c7fea66a9e80311e3a1bd87f5b1b0c817cf43d0fa128c21c87"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.1.0/sentry-cli-Linux-i686"
        sha256 "a9e1a8c854e8bfed05b057451f47dc7cfcc005cd8ec9a0632125f9f2cc57b589"
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
