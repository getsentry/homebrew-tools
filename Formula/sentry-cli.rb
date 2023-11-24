class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.22.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.22.1/sentry-cli-Darwin-universal"
    sha256 "508f76bd7ce43cdbab9e0b2ce068917ef95c0ea9c5a57ddd5546f95f8cdd8a3b"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.1/sentry-cli-Linux-aarch64"
        sha256 "c7ed4c6586692ed56ce84db202aa5e5dee48e5d56dcd45b42b45eb5384dcbffa"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.1/sentry-cli-Linux-armv7"
        sha256 "aa69ed00523ead7448dddb679e0c5a0f599a5808adff5205cb1397e1004f3203"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.1/sentry-cli-Linux-x86_64"
        sha256 "0a34cf9b3d3069b7a5c816650fa9cf07963ccc77e881629a6ed82db9727bdf91"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.1/sentry-cli-Linux-i686"
        sha256 "d8aeee45ae41a104d2cb1586eca953dbd697a6d1c92cb00ef45e3bf7c31bc70c"
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
