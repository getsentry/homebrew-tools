class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.19.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.19.1/sentry-cli-Darwin-universal"
    sha256 "4dc33d289c78138f03ef0ac99ec7b5be799551c6f3d4c5e147230c8f1bf7fb1c"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.1/sentry-cli-Linux-aarch64"
        sha256 "3b3188f52ac9f132db60ec59d896f475d9914d0af7da0b8236af12aac4097007"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.1/sentry-cli-Linux-armv7"
        sha256 "710c4be910c2d660d3e81488affb5f1c29d11deffede4da223d0548193e6d970"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.1/sentry-cli-Linux-x86_64"
        sha256 "88277b96230fd6d0257aaf373d4108abee6882e67fca012721a0cd5de7c63b5c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.1/sentry-cli-Linux-i686"
        sha256 "0e120b96dc565eb6d770809d7a21be4f5bce30ef432e482403e50aa24ffa7327"
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
