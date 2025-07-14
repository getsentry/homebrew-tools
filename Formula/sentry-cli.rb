class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.47.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.47.1/sentry-cli-Darwin-universal"
    sha256 "08d43e66fabade2d3b385c74f78e3be50f96846c5f8702400d7b81b3c672e4b2"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.47.1/sentry-cli-Linux-aarch64"
        sha256 "6ce920ff84c68d2c7b7cfd093adc35cf731adcdc5ccb2dc962505b44f31a3429"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.47.1/sentry-cli-Linux-armv7"
        sha256 "bc97edf7f5b776ca4f034a6d35b18934eb5fef3b4a030933bbdb3d6d38e10c4c"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.47.1/sentry-cli-Linux-x86_64"
        sha256 "6613872f1b21240fb5732be62620ef2bb40a436ce93955ca96393e6046947951"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.47.1/sentry-cli-Linux-i686"
        sha256 "a627aa2d4a985ff8d6ec4f01b27bdd411893b673c86d6446c23fbba18db80b7f"
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
