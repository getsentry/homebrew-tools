class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.21.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.21.0/sentry-cli-Darwin-universal"
    sha256 "b3ab63530e1ede801735f238d6e618d241b9c3d99bbad130d7e357746234c5ee"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.0/sentry-cli-Linux-aarch64"
        sha256 "d48487cac4b9975415e88eabbd1abf23a2d8f617f0468cf511cb42895288b858"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.0/sentry-cli-Linux-armv7"
        sha256 "58d7bd7de8ace92d5b8a89d6afe67b42d6ccb55e3d63554a14d8c448e15c53f9"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.0/sentry-cli-Linux-x86_64"
        sha256 "e3739b5525cf56c4b1242b14fe75e5ac52693607cb04d6a7ca83abf72cd3c5e0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.0/sentry-cli-Linux-i686"
        sha256 "c8fca626bee05137f69e12909d54ddb42f654b9cc2b3947beec36e01ca1ad0d8"
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
