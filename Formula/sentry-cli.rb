class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.36.6"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.36.6/sentry-cli-Darwin-universal"
    sha256 "3c5bf35a367a1ad45436b70ee47e3600b011543b83dd5a66bba04c131de35fdb"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.6/sentry-cli-Linux-aarch64"
        sha256 "01915e5930649b9867775e1ea0807742542bb8b98268cd4921a0eb1ad6146d97"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.6/sentry-cli-Linux-armv7"
        sha256 "791cb56b5bc3b4f5354f42561ff6e9dd287c0337b9d13f7ab1b562f80917c00b"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.6/sentry-cli-Linux-x86_64"
        sha256 "2ee44f63b820fc3f543ea362d83047738552457db7ffb49b4757d907f40daa96"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.6/sentry-cli-Linux-i686"
        sha256 "b3a8a896604616fb93ecbcf050d909a00a555c6751f0eb2be1ad7eed5c762b64"
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
